import 'dart:math';

import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:flutter_boilerplate/models/bgm/author.dart';
import "package:flutter_boilerplate/models/bgm/comment.dart" as CommentModel;
import 'package:flutter_boilerplate/models/bgm/quote.dart';
import 'package:flutter_boilerplate/stores/user.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_boilerplate/main.dart' show MyAppRouterDelegate;

const String GetEpisodeTopicReq = """
query GetEpisodeTopic(\$id: Int!) {
  episodeTopic(id: \$id) {
    comments {
      id
      floor
      time
      text
      author {
        name
        id
        msg
        avatar
      }
      replies {
        id
        floor
        time
        text
        quote {
          from
          text
        }
        author {
          name
          id
          msg
          avatar
        }
      }
    }
  }
}
""";

const String GetRepliesFrag = """
fragment replies on Comment {
  replies {
    id
    floor
    time
    text
    quote {
      from
      text
    }
    author {
      name
      id
      msg
      avatar
    }
  }
}
""";

class Main extends StatefulWidget {
  @override
  MainState createState() => MainState();
}

class MainState extends State<Main> {
  bool showInput = false;
  List<CommentModel.Comment> model;
  CommentModel.Comment replyTo;
  CommentModel.Comment replyBelongTo;
  ScrollController _controller = ScrollController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!Provider.of<UserStore>(context, listen: false).isAuth) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final router = Provider.of<MyAppRouterDelegate>(context, listen: false);
        final currentPath = router.currentConfiguration;
        final currentUrl = '${currentPath.uri.path}?${currentPath.uri.query}';
        router
          ..popRouteUntil((def) => def.name == '/')
          ..replaceRoute('/?redirect_from=${Uri.encodeComponent(currentUrl)}');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<UserStore>(context).isAuth
        ? GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              setState(() {
                setShowInput(!showInput);
                if (showInput) {
                  replyTo = null;
                  replyBelongTo = null;
                }
              });
            },
            child: Scaffold(
                body: Query(
                    options: QueryOptions(
                        document: gql(GetEpisodeTopicReq),
                        variables: {
                          'id': int.parse(
                              Provider.of<MyAppRouterDelegate>(context)
                                  .currentConfiguration
                                  .uri
                                  .queryParameters['id'])
                        }),
                    builder: (QueryResult result,
                        {Refetch refetch, FetchMore fetchMore}) {
                      Widget loading;
                      if (result.isLoading) {
                        model = null;
                        loading = SliverFillRemaining(
                            child: Center(
                          child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(
                                  Theme.of(context).accentColor)),
                        ));
                      } else if (result.isNotLoading && model == null) {
                        model = (result.data['episodeTopic']['comments']
                                as List<dynamic>)
                            .map<CommentModel.Comment>(
                                (item) => CommentModel.Comment.fromJson(item))
                            .toList();
                      }
                      return Stack(children: [
                        Padding(
                            padding:
                                EdgeInsets.only(bottom: showInput ? 192 : 0),
                            child: CustomScrollView(
                                controller: _controller,
                                slivers: [
                                  SliverAppBar(
                                    floating: true,
                                    pinned: true,
                                    flexibleSpace: FlexibleSpaceBar(
                                      title: Text('Comment'),
                                    ),
                                    expandedHeight: 250,
                                  ),
                                  model != null
                                      ? SliverList(
                                          delegate: SliverChildBuilderDelegate(
                                              (context, index) {
                                          return Comment(
                                              data: model[index],
                                              onReply: (replyTo) {
                                                setState(() {
                                                  this.replyTo = replyTo;
                                                  replyBelongTo = model[index];
                                                  setShowInput(true);
                                                });
                                              });
                                        }, childCount: model.length))
                                      : loading
                                ])),
                        CommentInput(
                          show: showInput,
                          replyTo: replyTo,
                          onCommit: (text) {
                            if (text.isEmpty) return;
                            var floor = "#${model.length + 1}";
                            if (replyTo != null) {
                              floor = replyTo.floor.replaceAllMapped(
                                  new RegExp(r'(\d).*'), (match) {
                                return "${match.group(1)}-${replyBelongTo.replies.length + 1}";
                              });
                            }
                            var now = DateTime.now();
                            var newComment = new CommentModel.Comment(
                                author: Author(
                                    id: 0,
                                    msg: '(我思故我在)',
                                    name: 'sociosarbis',
                                    avatar:
                                        "https://lain.bgm.tv/pic/user/s/icon.jpg"),
                                floor: floor,
                                id: Random().nextInt(1 << 30),
                                text: text,
                                quote:
                                    replyTo != null && replyTo.replies == null
                                        ? Quote(
                                            from: replyTo.author.name,
                                            text: replyTo.text)
                                        : null,
                                time:
                                    "${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}");
                            setState(() {
                              Map<String, dynamic> json = newComment.toJson();
                              GraphQLClient client =
                                  GraphQLProvider.of(context).value;
                              if (replyBelongTo == null) {
                                final req = Request(
                                    operation: Operation(
                                        document: gql(GetEpisodeTopicReq)),
                                    variables: {'id': 969984});
                                final cache = client.readQuery(req);
                                (cache['episodeTopic']['comments']
                                        as List<dynamic>)
                                    .add(json);
                                client.writeQuery(req, data: cache);
                                model.add(newComment);
                              } else {
                                replyBelongTo.replies.add(newComment);
                                final req = FragmentRequest(
                                    idFields: {
                                      '__typename': 'Comment',
                                      'id': replyBelongTo.id
                                    },
                                    fragment: Fragment(
                                        document: gql(GetRepliesFrag)));
                                final cache = client.readFragment(req);
                                (cache['replies'] as List<dynamic>).add(json);
                                client.writeFragment(req, data: cache);
                              }
                              setShowInput(false);
                              FocusScope.of(context).unfocus();
                            });
                          },
                        )
                      ]);
                    })))
        : Container();
  }

  setShowInput(bool state) {
    showInput = state;
    if (state == true) {
      _controller.animateTo(_controller.offset + 192,
          duration: Duration(milliseconds: 100), curve: Curves.easeOutCubic);
    }
  }

  replySomeone(
      /** 如果是回复评论，是自己的id；如果是回复评论的回复，则是评论用户的id */
      {int subReplyUid,
      /** 讨论页的id */
      int topicId,
      /** 评论或评论回复用户的id */
      int postUid,
      /** 评论的id */
      int postId,
      String content}) {}

  replyTopic(String content) {}
}

class Comment extends StatelessWidget {
  final CommentModel.Comment data;
  final bool isReply;
  final void Function(CommentModel.Comment replyTo) onReply;
  Comment({@required this.data, this.isReply = false, @required this.onReply})
      : super(key: ValueKey(data.id));
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: isReply
                ? EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 10)
                : EdgeInsets.all(10),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.baseline, children: [
              Container(
                  margin: EdgeInsets.only(right: 3),
                  child: Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffbbbbbb),
                          ),
                          BoxShadow(
                              color: Colors.white,
                              blurRadius: 1,
                              spreadRadius: -1)
                        ],
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            data.author.avatar,
                            fit: BoxFit.fill,
                          )))),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Expanded(
                            child: RichText(
                                text: TextSpan(
                                    style: TextStyle(color: Color(0xff999999)),
                                    children: <InlineSpan>[
                              TextSpan(
                                  text: data.author.name,
                                  style: TextStyle(
                                      color: Color(0xff0084B4),
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          data.replies == null ? 16 : 14)),
                              WidgetSpan(
                                  baseline: TextBaseline.alphabetic,
                                  alignment: PlaceholderAlignment.baseline,
                                  child: InkWell(
                                      onTap: () {
                                        onReply(data);
                                      },
                                      child: Text.rich(TextSpan(
                                          style: TextStyle(
                                              color: Color(0xffcccccc)),
                                          children: [
                                            WidgetSpan(
                                                child: Icon(Icons.comment,
                                                    size: 16,
                                                    color: Color(0xffcccccc))),
                                            TextSpan(text: '回复')
                                          ])))),
                              TextSpan(text: data.author.msg)
                            ]))),
                        RichText(
                            text: TextSpan(
                                style: TextStyle(color: Color(0xff999999)),
                                children: <TextSpan>[
                              TextSpan(text: '#${data.floor}'),
                              TextSpan(text: '- ${data.time}')
                            ])),
                      ]),
                  if (data.quote != null)
                    RichText(
                      text: TextSpan(children: [
                        WidgetSpan(
                            child: Container(
                                height: 14,
                                transform:
                                    Transform.translate(offset: Offset(0, -8))
                                        .transform,
                                child: Text('“',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Color(0xffcccccc))))),
                        TextSpan(
                            text: data.quote.from,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        TextSpan(
                            text: '说: ${data.quote.text}',
                            style: TextStyle(color: Color(0xff666666))),
                        WidgetSpan(
                            child: Container(
                                height: 14,
                                transform:
                                    Transform.translate(offset: Offset(0, -8))
                                        .transform,
                                child: Text('”',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Color(0xffcccccc))))),
                      ]),
                    ),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [TextSpan(text: data.text)]))
                ],
              ))
            ])),
        if (data.replies != null)
          for (var d in data.replies)
            Comment(data: d, onReply: onReply, isReply: true)
      ],
    );
  }
}

class CommentInput extends StatefulWidget {
  final bool show;
  final CommentModel.Comment replyTo;
  final void Function(String text) onCommit;
  CommentInput({this.show, this.replyTo, @required this.onCommit});
  @override
  CommentInputState createState() => CommentInputState();
}

class CommentInputState extends State<CommentInput> {
  TextEditingController _controller = new TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 0,
        bottom: 0,
        child: TweenAnimationBuilder(
            duration: Duration(milliseconds: widget.show ? 250 : 200),
            curve: widget.show ? Curves.easeOutCubic : Curves.easeInCubic,
            tween: Tween<double>(begin: 192, end: widget.show ? 0 : 192),
            builder: (context, value, child) => Container(
                width: MediaQuery.of(context).size.width,
                height: 192,
                transform:
                    Transform.translate(offset: Offset(0, value)).transform,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xffd9d9d9),
                        blurRadius: 5,
                        offset: Offset(0, -1))
                  ],
                ),
                child: child),
            child: GestureDetector(
                onTap: () {},
                child: SingleChildScrollView(
                    padding: EdgeInsets.all(10),
                    child: Container(
                        constraints: BoxConstraints(minHeight: 172),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  widget.replyTo == null
                                      ? '添加新回复'
                                      : '回复：${widget.replyTo.author.name}',
                                  style: TextStyle(color: Color(0xff3399ff))),
                              Container(
                                  margin: EdgeInsets.symmetric(vertical: 3),
                                  child: TextField(
                                      maxLines: null,
                                      controller: _controller,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffd9d9d9))),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    240, 145, 153, 0.6))),
                                      ))),
                              SizedBox(
                                  width: 71,
                                  height: 25,
                                  child: RaisedButton(
                                    elevation: 0,
                                    padding: EdgeInsets.all(0),
                                    color: Color(0xff319abf),
                                    textColor: Colors.white,
                                    child: Text(
                                        widget.replyTo == null ? '加上去' : '写好了'),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    onPressed: reply,
                                  ))
                            ]))))));
  }

  Future<void> reply() async {
    widget.onCommit(_controller.text);
    _controller.text = '';
  }
}

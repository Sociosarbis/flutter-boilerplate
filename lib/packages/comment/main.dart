import 'dart:math';

import "package:flutter/material.dart";
import 'package:flutter_boilerplate/models/bgm/author.dart';
import "package:flutter_boilerplate/models/bgm/comment.dart" as CommentModel;
import 'package:flutter_boilerplate/models/bgm/quote.dart';
import 'package:flutter_boilerplate/stores/user.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_boilerplate/components/click_outside.dart';
import 'package:flutter_boilerplate/components/router/lib.dart';

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

const String GetSubjectPosterReq = """
query GetEpisodePoster(\$id: Int!) {
  subjectDetail(id: \$id) {
    image
  }
}
""";

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  MainState createState() => MainState();
}

class MainState extends State<Main> {
  bool showInput = false;
  List<CommentModel.Comment>? model;
  int subjectId = 0;
  int epId = 0;
  String poster = '';
  CommentModel.Comment? replyTo;
  CommentModel.Comment? replyBelongTo;
  final ScrollController _controller = ScrollController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!Provider.of<UserStore>(context, listen: false).isAuth) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final currentUrl = routerContext.currentPath;
        routerContext.replace("/bgm/login?redirect_from=${Uri.encodeComponent(currentUrl)}");
      });
    } else {
      final params = routerContext.params.asStringMap();
      epId = int.parse(params['id']!);
      subjectId = int.parse(params['subject_id']!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData(devicePixelRatio: devicePixelRatio) = MediaQuery.of(context);
    return Provider.of<UserStore>(context).isAuth
        ? ClickOutsideListener(
            child: Scaffold(
                body: Stack(children: [
            Query(
                options: QueryOptions(
                    document: gql(GetSubjectPosterReq),
                    variables: {'id': subjectId}),
                builder: (QueryResult result,
                    {Refetch? refetch, FetchMore? fetchMore}) {
                  if (result.isNotLoading) {
                    if (result.data?.isNotEmpty ?? false) {
                      final newPoster =
                          result.data!['subjectDetail']['image'] as String;
                      if (newPoster != poster) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          setState(() {
                            poster = newPoster;
                          });
                        });
                      }
                    }
                  }
                  return const SizedBox.shrink();
                }),
            Query(
                options: QueryOptions(
                    document: gql(GetEpisodeTopicReq), variables: {'id': epId}),
                builder: (QueryResult result,
                    {Refetch? refetch, FetchMore? fetchMore}) {
                  Widget? loading;
                  if (result.isLoading) {
                    model = null;
                    loading = SliverFillRemaining(
                        child: Center(
                      child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(
                              Theme.of(context).colorScheme.secondary)),
                    ));
                  } else if (result.isNotLoading && model == null) {
                    model = (result.data!['episodeTopic']['comments']
                            as List<dynamic>)
                        .map<CommentModel.Comment>(
                            (item) => CommentModel.Comment.fromJson(item))
                        .toList();
                  }
                  return Stack(children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: showInput ? 192 : 0),
                        child:
                            CustomScrollView(controller: _controller, slivers: [
                          SliverAppBar(
                            floating: true,
                            pinned: true,
                            flexibleSpace: FlexibleSpaceBar(
                                title: const Text('Comment'),
                                background: poster.isNotEmpty
                                    ? Image.network(poster,
                                        fit: BoxFit.cover,
                                        color: Colors.black.withOpacity(0.5),
                                        colorBlendMode: BlendMode.hardLight, cacheHeight: (250 * devicePixelRatio).round(),)
                                    : const SizedBox.shrink()),
                            expandedHeight: 250,
                          ),
                          model != null
                              ? SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                      (context, index) {
                                  return Comment(
                                      data: model![index],
                                      onReply: (replyTo) {
                                        setState(() {
                                          this.replyTo = replyTo;
                                          replyBelongTo = model![index];
                                          setShowInput(true);
                                        });
                                      });
                                }, childCount: model!.length))
                              : loading!
                        ])),
                    ClickOutside(
                        child: CommentInput(
                            show: showInput,
                            replyTo: replyTo,
                            onCommit: confirmReply),
                        onClickOutside: () {
                          setState(() {
                            FocusScope.of(context).unfocus();
                            setShowInput(!showInput);
                            if (showInput) {
                              replyTo = null;
                              replyBelongTo = null;
                            }
                          });
                        })
                  ]);
                })
          ])))
        : const SizedBox.shrink();
  }

  setShowInput(bool state) {
    showInput = state;
    if (state == true) {
      _controller.animateTo(_controller.offset + 192,
          duration: const Duration(milliseconds: 100), curve: Curves.easeOutCubic);
    }
  }

  replySomeone(
      /** 如果是回复评论，是自己的id；如果是回复评论的回复，则是评论用户的id */
      {int subReplyUid = 0,
      /** 讨论页的id */
      int topicId = 0,
      /** 评论或评论回复用户的id */
      int postUid = 0,
      /** 评论的id */
      int postId = 0,
      String content = ''}) {}

  replyTopic(String content) {}

  confirmReply(String text) {
    if (text.isEmpty) return;
    var floor = "#${model!.length + 1}";
    if (replyTo != null) {
      floor = replyTo!.floor!.replaceAllMapped(RegExp(r'(\d).*'), (match) {
        return "${match.group(1)}-${replyBelongTo!.replies!.length + 1}";
      });
    }
    var now = DateTime.now();
    var newComment = CommentModel.Comment(
        author: Author(
            id: 0,
            msg: '(我思故我在)',
            name: 'sociosarbis',
            avatar: "https://lain.bgm.tv/pic/user/s/icon.jpg"),
        floor: floor,
        id: Random().nextInt(1 << 30),
        text: text,
        quote: replyTo != null && replyTo?.replies == null
            ? Quote(from: replyTo!.author?.name, text: replyTo?.text)
            : null,
        time: "${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}");
    setState(() {
      Map<String, dynamic> json = newComment.toJson();
      GraphQLClient client = GraphQLProvider.of(context).value;
      if (replyBelongTo == null) {
        final req = Request(
            operation: Operation(document: gql(GetEpisodeTopicReq)),
            variables: const {'id': 969984});
        final cache = client.readQuery(req)!;
        (cache['episodeTopic']['comments'] as List<dynamic>).add(json);
        client.writeQuery(req, data: cache);
        model?.add(newComment);
      } else {
        replyBelongTo!.replies?.add(newComment);
        final req = FragmentRequest(
            idFields: {'__typename': 'Comment', 'id': replyBelongTo!.id},
            fragment: Fragment(document: gql(GetRepliesFrag)));
        final cache = client.readFragment(req)!;
        (cache['replies'] as List<dynamic>).add(json);
        client.writeFragment(req, data: cache);
      }
      setShowInput(false);
      FocusScope.of(context).unfocus();
    });
  }
}

class Comment extends StatelessWidget {
  final CommentModel.Comment data;
  final bool isReply;
  final void Function(CommentModel.Comment replyTo) onReply;
  Comment({required this.data, this.isReply = false, required this.onReply})
      : super(key: ValueKey(data.id));
  @override
  Widget build(BuildContext context) {
    final MediaQueryData(devicePixelRatio: devicePixelRatio) = MediaQuery.of(context);
    return Column(
      children: [
        Container(
            padding: isReply
                ? const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 10)
                : const EdgeInsets.all(10),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.baseline, textBaseline: TextBaseline.alphabetic, children: [
              Container(
                  margin: const EdgeInsets.only(right: 3),
                  child: Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
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
                            data.author?.avatar ?? '',
                            fit: BoxFit.fill,
                            cacheWidth: (40 * devicePixelRatio).round(),
                          )))),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Expanded(
                            child: RichText(
                                text: TextSpan(
                                    style: const TextStyle(color: Color(0xff999999)),
                                    children: <InlineSpan>[
                              TextSpan(
                                  text: data.author?.name,
                                  style: TextStyle(
                                      color: const Color(0xff0084B4),
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
                                      child: const Text.rich(TextSpan(
                                          style: TextStyle(
                                              color: Color(0xffcccccc)),
                                          children: [
                                            WidgetSpan(
                                                child: Icon(Icons.comment,
                                                    size: 16,
                                                    color: Color(0xffcccccc))),
                                            TextSpan(text: '回复')
                                          ])))),
                              TextSpan(text: data.author?.msg)
                            ]))),
                        RichText(
                            text: TextSpan(
                                style: const TextStyle(color: Color(0xff999999)),
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
                                    Transform.translate(offset: const Offset(0, -8))
                                        .transform,
                                child: const Text('“',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Color(0xffcccccc))))),
                        TextSpan(
                            text: data.quote?.from,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        TextSpan(
                            text: '说: ${data.quote?.text}',
                            style: const TextStyle(color: Color(0xff666666))),
                        WidgetSpan(
                            child: Container(
                                height: 14,
                                transform:
                                    Transform.translate(offset: const Offset(0, -8))
                                        .transform,
                                child: const Text('”',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Color(0xffcccccc))))),
                      ]),
                    ),
                  RichText(
                      text: TextSpan(
                          style: const TextStyle(color: Colors.black),
                          children: [TextSpan(text: data.text)]))
                ],
              ))
            ])),
        if (data.replies != null)
          for (var d in data.replies!)
            Comment(data: d, onReply: onReply, isReply: true)
      ],
    );
  }
}

class CommentInput extends StatefulWidget {
  final bool? show;
  final CommentModel.Comment? replyTo;
  final void Function(String text) onCommit;
  const CommentInput({super.key, this.show, this.replyTo, required this.onCommit});
  @override
  CommentInputState createState() => CommentInputState();
}

class CommentInputState extends State<CommentInput> {
  final TextEditingController _controller = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 0,
        bottom: 0,
        child: TweenAnimationBuilder(
            duration: Duration(milliseconds: widget.show ?? false ? 250 : 200),
            curve:
                widget.show ?? false ? Curves.easeOutCubic : Curves.easeInCubic,
            tween:
                Tween<double>(begin: 192, end: widget.show ?? false ? 0 : 192),
            builder: (context, value, child) => Container(
                width: MediaQuery.of(context).size.width,
                height: 192,
                transform:
                    Transform.translate(offset: Offset(0, value))
                        .transform,
                decoration: const BoxDecoration(
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
                    padding: const EdgeInsets.all(10),
                    child: Container(
                        constraints: const BoxConstraints(minHeight: 172),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  widget.replyTo == null
                                      ? '添加新回复'
                                      : '回复：${widget.replyTo?.author?.name}',
                                  style: const TextStyle(color: Color(0xff3399ff))),
                              Container(
                                  margin: const EdgeInsets.symmetric(vertical: 3),
                                  child: TextField(
                                      maxLines: null,
                                      controller: _controller,
                                      decoration: const InputDecoration(
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
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      elevation: 0,
                                      padding: const EdgeInsets.all(0),
                                      backgroundColor: const Color(0xff319abf),
                                      textStyle: const TextStyle(color: Colors.white),
                                    ),
                                    child: Text(
                                        widget.replyTo == null ? '加上去' : '写好了'),
                                    onPressed: reply,
                                  ))
                            ]))))));
  }

  Future<void> reply() async {
    widget.onCommit(_controller.text);
    _controller.text = '';
  }
}

import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import "package:flutter_boilerplate/models/bgm/comment.dart" as CommentModel;
import 'package:graphql_flutter/graphql_flutter.dart';

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

class Main extends StatefulWidget {
  @override
  MainState createState() => MainState();
}

class MainState extends State<Main> {
  bool showInput = false;
  List<CommentModel.Comment> model;

  @override
  Widget build(BuildContext context) {
    List<CommentModel.Comment> model;
    return Query(
        options: QueryOptions(
            document: gql(GetEpisodeTopicReq),
            variables: {'id': 969984},
            cacheRereadPolicy: CacheRereadPolicy.ignoreAll),
        builder: (QueryResult result, {Refetch refetch, FetchMore fetchMore}) {
          if (result.isLoading) {
            model = null;
            return Center(
              child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation(Theme.of(context).accentColor)),
            );
          } else if (result.isNotLoading && model == null) {
            model = (result.data['episodeTopic']['comments'] as List<dynamic>)
                .map<CommentModel.Comment>(
                    (item) => CommentModel.Comment.fromJson(item))
                .toList();
          }
          return model != null
              ? GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    setState(() {
                      showInput = !showInput;
                    });
                  },
                  child: Scaffold(
                      appBar: AppBar(title: Text('Comment')),
                      body: Stack(children: [
                        ListView.builder(
                            itemCount: model.length,
                            itemBuilder: (context, index) {
                              return Comment(
                                  data: model[index],
                                  onReply: () {
                                    setState(() {
                                      showInput = true;
                                    });
                                  });
                            }),
                        CommentInput(show: showInput)
                      ])))
              : Container();
        });
  }
}

class Comment extends StatelessWidget {
  final CommentModel.Comment data;
  final bool isReply;
  final void Function() onReply;
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
                                        onReply();
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
  CommentInput({this.show});
  @override
  CommentInputState createState() => CommentInputState();
}

class CommentInputState extends State<CommentInput> {
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
                              Text('添加新回复',
                                  style: TextStyle(color: Color(0xff3399ff))),
                              Container(
                                  margin: EdgeInsets.symmetric(vertical: 3),
                                  child: TextField(
                                      maxLines: null,
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
                                    child: Text('加上去'),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    onPressed: () {},
                                  ))
                            ]))))));
  }
}

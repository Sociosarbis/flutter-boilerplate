import "package:flutter/material.dart";
import "package:flutter_boilerplate/models/bgm/comment.dart" as CommentModel;
import 'data.dart';

class Main extends StatefulWidget {
  @override
  MainState createState() => MainState();
}

class MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    List<CommentModel.Comment> model =
        data.map((item) => CommentModel.Comment.fromJson(item)).toList();
    return Scaffold(
        appBar: AppBar(title: Text('Comment')),
        body: Align(
            alignment: Alignment.topCenter,
            child: Column(
                children: [for (var data in model) Comment(data: data)])));
  }
}

class Comment extends StatelessWidget {
  final CommentModel.Comment data;
  Comment({@required this.data}) : super(key: ValueKey(data.id));
  @override
  Widget build(BuildContext context) {
    print(data.quote);
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  margin: EdgeInsets.only(right: 3),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffbbbbbb),
                          ),
                          BoxShadow(
                              color: Colors.white,
                              blurRadius: 2,
                              spreadRadius: -2)
                        ],
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                              'http://lain.bgm.tv/pic/user/s/000/22/87/228731.jpg',
                              width: 40,
                              height: 40)))),
              Expanded(
                  child: Container(
                      child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Expanded(
                        child: RichText(
                            text: TextSpan(
                                style: TextStyle(color: Color(0xff999999)),
                                children: <TextSpan>[
                          TextSpan(
                              text: data.author.name,
                              style: TextStyle(color: Color(0xff0084B4))),
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
                            alignment: PlaceholderAlignment.top,
                            child: Container(
                                height: 14,
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text('“',
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Color(0xffcccccc)))))),
                        TextSpan(
                            text: data.quote.from,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        TextSpan(
                            text: '说: ${data.quote.text}',
                            style: TextStyle(color: Color(0xff666666))),
                        WidgetSpan(
                            alignment: PlaceholderAlignment.top,
                            child: Container(
                                height: 14,
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
              )))
            ]),
            if (data.replies != null)
              for (var d in data.replies) Comment(data: d)
          ],
        ));
  }
}

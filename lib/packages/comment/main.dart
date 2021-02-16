import "package:flutter/material.dart";

class Main extends StatefulWidget {
  @override
  MainState createState() => MainState();
}

class MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Comment')),
        body: Align(
            alignment: Alignment.topCenter,
            child: Container(
                width: 300,
                child: Column(
                  children: [
                    Container(
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                          width: 32,
                                          height: 32)))),
                          Container(
                              width: 254,
                              padding: EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 10.0),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffe8e8e8)),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      Text('YIE',
                                          style: TextStyle(
                                              color: Color(0xff0084B4))),
                                      Text('@ 1h 28m ago',
                                          style: TextStyle(
                                              color: Color(0xff999999))),
                                      Stack(children: [
                                        Row(children: [
                                          for (var _
                                              in Iterable<int>.generate(5))
                                            Icon(Icons.star,
                                                color: Color.fromRGBO(
                                                    220, 220, 220, 1.0),
                                                size: 10)
                                        ]),
                                        ClipRect(
                                            child: Align(
                                          alignment: Alignment.topLeft,
                                          widthFactor: 0.7,
                                          child: Row(
                                            children: [
                                              for (var _
                                                  in Iterable<int>.generate(5))
                                                Icon(Icons.star,
                                                    color: Color(0xffffa037),
                                                    size: 10)
                                            ],
                                          ),
                                        ))
                                      ])
                                    ]),
                                    Text('我就喜欢看恋爱番')
                                  ]))
                        ]))
                  ],
                ))));
  }
}

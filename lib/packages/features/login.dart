import 'dart:async';
import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uni_links/uni_links.dart';
import 'package:http/http.dart';
import 'package:flutter_boilerplate/data/data.dart' as config;

const clientId = 'c519d84eb02f944b8541';
const redirectURI = 'flutterboilerplate://login';

class Main extends StatefulWidget {
  @override
  MainState createState() => MainState();
}

class MainState extends State<Main> {
  String token = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Key('login screen'),
        appBar: AppBar(title: Text('Github login')),
        body: Sub(
          token: token,
          onAuth: onAuth,
        ));
  }

  onAuth(String token) {
    setState(() {
      this.token = token;
    });
  }
}

class Sub extends StatefulWidget {
  final String token;
  final void Function(String token) onAuth;
  Sub({@required this.token, @required this.onAuth});
  @override
  SubState createState() => SubState();
}

class SubState extends State<Sub> {
  bool isRequesting = false;
  final _textController = TextEditingController();
  StreamSubscription<Uri> sub;
  StreamSubscription<dynamic> sub2;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Loading(
        visible: isRequesting,
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              margin: EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                child: Text('login'),
                onPressed: () => goToGithubOauth(),
              )),
          if (widget.token != '')
            Column(children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: SizedBox(
                    width: 200,
                    height: 50,
                    child: TextFormField(
                      controller: _textController,
                      decoration: InputDecoration(
                          hintText: '用户名', border: OutlineInputBorder()),
                    )),
              ),
              ElevatedButton(
                child: Text('followers'),
                onPressed: () async {
                  final ret = await getFollowers();
                  if (ret != null) {
                    print(ret);
                  }
                },
              )
            ])
        ])));
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    if (sub2 != null) sub2.cancel();
    super.dispose();
  }

  goToGithubOauth() async {
    final scope = Uri.encodeComponent('user,repo,read:org,notifications');
    final url =
        'https://github.com/login/oauth/authorize?client_id=$clientId&redirect_uri=$redirectURI&scope=$scope';
    setState(() {
      isRequesting = true;
    });
    if (await canLaunch(url)) {
      sub = getUriLinksStream().listen((uri) async {
        if (uri.hasQuery) {
          final code = uri.queryParameters['code'] ?? '';
          final res = await post('https://github.com/login/oauth/access_token',
              headers: {
                'Accept': 'application/json'
              },
              body: {
                'client_id': clientId,
                'client_secret': config.data['client_secret'],
                'code': code
              });
          widget.onAuth(jsonDecode(res.body)['access_token']);
        }
        sub.cancel();
        setState(() {
          isRequesting = false;
        });
      }, onError: (err) {
        print(err);
        setState(() {
          isRequesting = false;
        });
        sub.cancel();
      });
      launch(url);
    }
  }

  getFollowers() async {
    if (isRequesting) return;
    setState(() {
      isRequesting = true;
    });
    final completer = Completer();
    try {
      final data = await completer.future;
      return data;
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isRequesting = false;
      });
    }
  }
}

class Loading extends StatelessWidget {
  final Widget child;
  final bool visible;
  final String text;
  Loading({@required this.visible, this.child, this.text});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AbsorbPointer(
        absorbing: visible,
        child: Stack(
          children: [
            child,
            if (visible)
              Center(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(theme.accentColor)),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    color: Colors.black,
                    child: Text(text, style: TextStyle(color: Colors.white)))
              ]))
          ],
        ));
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:ferry/ferry.dart' as ferry;
import 'package:flutter/rendering.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_boilerplate/graphql/github.req.gql.dart';
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
  ferry.Client client;
  StreamSubscription<Uri> sub;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          margin: EdgeInsets.only(bottom: 20),
          child: ElevatedButton(
            child: Text('login'),
            onPressed: () => goToGithubOauth(),
          )),
      if (widget.token != '')
        ElevatedButton(
          child: Text('followers'),
          onPressed: () async {
            final ret = await getFollowers();
            if (ret != null) {
              print(ret);
            }
          },
        )
    ]));
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    final link = HttpLink("https://api.github.com/graphql",
        defaultHeaders: {"Authorization": "Bearer ${widget.token}"});
    client = ferry.Client(link: link);
  }

  goToGithubOauth() async {
    final scope = Uri.encodeComponent('user,repo,read:org,notifications');
    final url =
        'https://github.com/login/oauth/authorize?client_id=$clientId&redirect_uri=$redirectURI&scope=$scope';
    if (await canLaunch(url)) {
      print(await getInitialLink());
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
      }, onError: (err) {
        print(err);
        sub.cancel();
      });
      launch(url);
    }
  }

  getFollowers() async {
    if (isRequesting) return;
    isRequesting = true;
    final completer = Completer();
    client
        .request(GFollowersReq((b) => b..vars.login = 'sociosarbis'))
        .listen((response) => {completer.complete(response.data.toJson())});
    final data = await completer.future;
    isRequesting = false;
    return data;
  }
}

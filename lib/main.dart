import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/packages/details/main.dart';
import 'package:flutter_boilerplate/packages/features/animated_container.dart'
    as AnimatedContainer;

void main() {
  runApp(MyApp());
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          )),
      SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ))
    ]);
  }

  void _toggleFavorite() {
    setState(() {
      _favoriteCount += _isFavorited ? -1 : 1;
      _isFavorited = !_isFavorited;
    });
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Welcome To Flutter', home: Main());
  }
}

class Main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    Widget titleSection = Container(
        padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text('Oeschinen Lake Campground',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Text('Kandersteg, Switzerland',
                      style: TextStyle(color: Colors.grey[500]))
                ],
              ),
            ),
            FavoriteWidget(),
          ],
        ));

    Widget buttonSection = Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(
            color, Icons.call, 'CALL', () => this._goToDetails(context)),
        _buildButtonColumn(
            color, Icons.near_me, 'ROUTE', () => this._goToDetails(context)),
        _buildButtonColumn(
            color, Icons.share, 'SHARE', () => this._goToDetails(context))
      ],
    ));

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: ListView(
          children: [
            Image.asset('images/lake.jpg',
                width: 600, height: 240, fit: BoxFit.cover),
            titleSection,
            buttonSection,
            textSection,
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AnimatedContainer.Main()));
                },
                child: Text('Animated Container'))
          ],
        ));
  }

  Column _buildButtonColumn(
      Color color, IconData icon, String label, void onPress()) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(icon, color: color),
          onPressed: onPress,
        ),
        Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(label,
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w400, color: color)))
      ],
    );
  }

  void _goToDetails(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Details()));
  }
}

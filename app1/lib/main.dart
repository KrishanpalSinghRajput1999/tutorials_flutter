import 'package:app1/list_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _bottomItems = [
    {"icon": Icons.home},
    {"icon": Icons.bookmark},
    {"icon": Icons.mail},
    {"icon": Icons.group},
  ];

  int _currentTab = 0;
  String _apiUrl = 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=04236e3e609b4d228d0c072d3e1b997b';
  int _total = 0;
  List _articles = [];

  bool _loading = true;

  @override
  void initState() {
    super.initState();

    http.get(_apiUrl).then((response) {
      var data = json.decode(response.body);
      setState(() {
        _total = data['totalResults'];
        _articles = data['articles'];
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: _buildBottomNavigation(context),
      body: _buildBody(context),
    );
  }

  _buildBottomNavigation(BuildContext context) {
    var _items = <BottomNavigationBarItem>[];

    for (var item in _bottomItems) {
      _items.add(new BottomNavigationBarItem(
        icon: new Icon(
          item['icon'],
          color: Colors.black,
        ),
        title: new Text(''),
      ));
    }

    return new BottomNavigationBar(
      currentIndex: _currentTab,
      items: _items,
      onTap: (index) {
        setState(() {
          _currentTab = index;
        });
      },
    );
  }

  _buildBody(BuildContext context) {
    if (_loading) {
      return new SpinKitRotatingCircle(
        color: Colors.blue,
        size: 50.0,
      );
    }

    return new ListView.builder(
      itemBuilder: (context, index) {
        return new Padding(
          padding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: new ListItem(data: _articles[index]),
        );
      },
      itemCount: _total,
    );
  }
}

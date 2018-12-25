import 'package:app1/list_item.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: _buildBottomNavigation(context),
      body: new ListView.builder(
        itemBuilder: (context, index) {
          return new Padding(
            padding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: new ListItem(),
          );
        },
        itemCount: 10,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
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
}

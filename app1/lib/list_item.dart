import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 2.0,
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(16.0),
      ),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new ClipRRect(
            child: new Image.network(
                'https://images.unsplash.com/photo-1545647274-96644da34363?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60'),
            borderRadius: BorderRadius.only(
              topLeft: new Radius.circular(16.0),
              topRight: new Radius.circular(16.0),
            ),
          ),
          new Padding(
            padding: new EdgeInsets.all(16.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  'This is title text'.toUpperCase(),
                  style: Theme.of(context).textTheme.title,
                ),
                new SizedBox(height: 16.0),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text('19 March 2018'),
                    new Text('10 min'),
                    new Text('125k views'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
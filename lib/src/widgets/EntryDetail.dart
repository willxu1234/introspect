import 'package:flutter/material.dart';

class EntryDetailWidget extends StatefulWidget {
  final int _data;

  EntryDetailWidget(this._data);

  @override
  _EntryDetailWidgetState createState() => _EntryDetailWidgetState();
}

class _EntryDetailWidgetState extends State<EntryDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget._data.toString(),
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }
}

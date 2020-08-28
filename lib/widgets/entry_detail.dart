import 'package:flutter/material.dart';
import 'package:introspect/models/entries.dart';
import 'package:provider/provider.dart';

class EntryDetailWidget extends StatefulWidget {
  final int _index;

  EntryDetailWidget(this._index);

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
              Consumer<EntriesModel>(builder: (context, entries, child) {
                return Text(
                  entries.getEntry(widget._index).body,
                  style: Theme.of(context).textTheme.headline1,
                );
              }),
            ]),
      ),
    );
  }
}

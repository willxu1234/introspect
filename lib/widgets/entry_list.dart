import 'package:flutter/material.dart';

typedef void EntrySelectedCallback(int value);

class EntryListWidget extends StatefulWidget {
  final int _count;
  final EntrySelectedCallback _onEntrySelected;

  EntryListWidget(this._count, this._onEntrySelected);

  @override
  _EntryListWidgetState createState() => _EntryListWidgetState();
}

class _EntryListWidgetState extends State<EntryListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget._count,
      itemBuilder: (context, position) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              widget._onEntrySelected(position);
            },
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(position.toString()),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

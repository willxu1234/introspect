import 'package:flutter/material.dart';

typedef void EntrySelectedCallback(int value);

class EntryListWidget extends StatefulWidget {
  final int count;
  final EntrySelectedCallback onEntrySelected;

  EntryListWidget(this.count, this.onEntrySelected);

  @override
  _EntryListWidgetState createState() => _EntryListWidgetState();
}

class _EntryListWidgetState extends State<EntryListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.count,
      itemBuilder: (context, position) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              widget.onEntrySelected(position);
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

import 'package:flutter/material.dart';
import 'package:introspect/models/entries.dart';
import 'package:provider/provider.dart';

typedef void EntrySelectedCallback(int value);

class EntryListWidget extends StatefulWidget {
  final EntrySelectedCallback _onEntrySelected;

  EntryListWidget(this._onEntrySelected);

  @override
  _EntryListWidgetState createState() => _EntryListWidgetState();
}

class _EntryListWidgetState extends State<EntryListWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EntriesModel>(builder: (context, entries, child) {
      return ListView.builder(
        itemCount: entries.length,
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
                    child: Text(entries.getEntry(position).title),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}

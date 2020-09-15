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
    // Retrieves entries directly from EntriesModel.
    return Consumer<EntriesModel>(builder: (context, entries, child) {
      return ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: <Widget>[
              Expanded(
                child: InkWell(
                  onTap: () {
                    // Set position on tap in HomePage through callback.
                    widget._onEntrySelected(position);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    // Choose which entry to display.
                    child: Text(entries.getEntry(position).body,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: entries.getEntry(position).emotion.color)),
                  ),
                ),
              ),
            ]),
          );
        },
      );
    });
  }
}

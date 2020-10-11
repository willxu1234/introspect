import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  // Used to generate date headers.
  @override
  Widget build(BuildContext context) {
    // Retrieves entries directly from EntriesModel.
    return Consumer<EntriesModel>(builder: (context, entries, child) {
      return ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, position) {
          Entry entry = entries.getEntry(position);

          return Column(children: <Widget>[
            (() {
              // Anonymous immediate function used to dynamically generate a
              // header if the month changed.
              if (position == 0 ||
                  entry.date.month !=
                      entries.getEntry(position - 1).date.month) {
                return SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.0, left: 16.0),
                      child: Text(DateFormat.yMMM().format(entry.date),
                          style: Theme.of(context).textTheme.headline6),
                    ));
              }
              return Container();
            }()),
            ListTile(
              dense: true,
              leading: Icon(Icons.face, color: entry.emotion.color, size: 36),
              trailing: const Icon(Icons.more_vert),
              title: Text(entry.body,
                  overflow: TextOverflow.fade, maxLines: 1, softWrap: false),
              subtitle: Text(DateFormat.yMMMd().add_jm().format(entry.date)),
              onTap: () {
                // Set position on tap in Homepage through callback.
                widget._onEntrySelected(position);
              },
            ),
            // Add some padding at the end so users can scroll past the bottom.
            position == entries.length - 1
                ? Padding(padding: EdgeInsets.only(bottom: 96.0))
                : Container()
          ]);
        },
      );
    });
  }
}

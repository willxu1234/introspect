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
                return Column(children: <Widget>[
                  SizedBox(
                      width: double.infinity,
                      child: Padding(
                          padding: EdgeInsets.only(top: 16.0, left: 16.0),
                          child: Text(DateFormat.yMMM().format(entry.date),
                              style: Theme.of(context).textTheme.headline5))),
                  Divider(),
                ]);
              }
              return Container();
            }()),
            Container(
              margin: EdgeInsets.only(left: 5.0, bottom: 5.0, top: 5.0),
              decoration: BoxDecoration(
                  border: Border(
                      left:
                          BorderSide(width: 5.0, color: entry.emotion.color))),
              child: ListTile(
                dense: true,
                trailing: const Icon(Icons.more_vert),
                title: Text(entry.body,
                    overflow: TextOverflow.fade, maxLines: 1, softWrap: false),
                subtitle: Text(DateFormat.yMMMd().add_jm().format(entry.date)),
                onTap: () {
                  // Set position on tap in Homepage through callback.
                  widget._onEntrySelected(position);
                },
                contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
              ),
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

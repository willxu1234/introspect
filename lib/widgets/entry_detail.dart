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
        child: Consumer<EntriesModel>(builder: (context, entries, child) {
          // Retrieves directly from EntriesModel.
          final entry = entries.getEntry(widget._index);

          return Column(
              // Displays a column of entry details.
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  entry.date.toString(),
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(entry.emotion.name,
                    // Override the theme color.
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: entry.emotion.color)),
                Text(
                  entry.body,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ]);
        }),
      ),
    );
  }
}

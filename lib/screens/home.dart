import 'package:flutter/material.dart';
import 'package:introspect/screens/add_entry.dart';
import 'package:introspect/screens/entry_detail.dart';
import 'package:introspect/widgets/entry_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OrientationBuilder(builder: (context, orientation) {
        return Row(children: <Widget>[
          Expanded(
            // Create list of journal entries, link to detail on click.
            child: EntryListWidget((index) {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return EntryDetailPage(index);
                },
              ));
            }),
          ),
        ]);
      }),
      // Add button.
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Send to add page on press.
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return AddEntryPage();
            },
          ));
        },
        tooltip: 'Write an Entry',
        label: Text('Compose'),
        icon: Icon(Icons.add),
      ),
    );
  }
}

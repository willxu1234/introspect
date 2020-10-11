import 'package:flutter/material.dart';
import 'package:introspect/models/entries.dart';
import 'package:introspect/screens/add_entry.dart';
import 'package:introspect/screens/entry_detail.dart';
import 'package:introspect/widgets/entry_list.dart';
import 'package:introspect/widgets/reusable_widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.getAppBar(),
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
        onPressed: () async {
          // Send to add page on press.
          Entry newEntry =
              await Navigator.push(context, MaterialPageRoute<Entry>(
            builder: (context) {
              return AddEntryPageOne();
            },
          ));
          if (newEntry != null) {
            // Directly adds entry to EntriesModel.
            Provider.of<EntriesModel>(context, listen: false).add(newEntry);
          }
        },
        tooltip: 'Write an Entry',
        label: Text('Compose'),
        icon: Icon(Icons.add),
      ),
      // Add bottom navigation to the home screen, provide a callback that moves
      // around.
      bottomNavigationBar: BottomNavigation(
          routeIndex: 0,
          onTap: (index) {
            if (index != 0) {
              Navigator.pushNamed(
                context,
                BottomNavigation.routes[index],
                /* arguments */
              );
            }
          }),
    );
  }
}

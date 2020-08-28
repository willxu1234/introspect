import 'package:flutter/material.dart';
import 'package:introspect/models/entries.dart';
import 'package:introspect/screens/add_entry.dart';
import 'package:introspect/screens/entry_detail.dart';
import 'package:introspect/widgets/entry_detail.dart';
import 'package:introspect/widgets/entry_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _entryCount = 5;
  int _selectedIndex = 0;
  bool _isLargeScreen = false;

  void _onEntryAdded(Entry entry) {
    // TODO: get entry data from form and add an actual entry.
    setState(() {
      _entryCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OrientationBuilder(builder: (context, orientation) {
        _isLargeScreen = MediaQuery.of(context).size.width > 600;

        return Row(children: <Widget>[
          Expanded(
            child: Consumer<EntriesModel>(builder: (context, entries, child) {
              return EntryListWidget(entries.length, (index) {
                if (_isLargeScreen) {
                  _selectedIndex = index;
                  setState(() {});
                } else {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return EntryDetailPage(index);
                    },
                  ));
                }
              });
            }),
          ),
          _isLargeScreen
              ? Expanded(child: EntryDetailWidget(_selectedIndex))
              : Container(),
        ]);
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return AddEntryPage();
            },
          ));
        },
        tooltip: 'Write an Entry',
        child: Icon(Icons.add),
      ),
    );
  }
}

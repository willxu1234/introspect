import 'package:flutter/material.dart';
import 'package:introspect/src/classes/Entry.dart';
import 'package:introspect/src/routes/AddEntryPage.dart';
import 'package:introspect/src/routes/EntryDetailPage.dart';
import 'package:introspect/src/widgets/EntryDetail.dart';
import 'package:introspect/src/widgets/EntryList.dart';

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
            child: EntryListWidget(_entryCount, (index) {
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
              return AddEntryPage(_onEntryAdded);
            },
          ));
        },
        tooltip: 'Write an Entry',
        child: Icon(Icons.add),
      ),
    );
  }
}

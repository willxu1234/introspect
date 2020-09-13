import 'package:flutter/material.dart';
import 'package:introspect/screens/add_entry.dart';
import 'package:introspect/screens/entry_detail.dart';
import 'package:introspect/widgets/entry_detail.dart';
import 'package:introspect/widgets/entry_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  // True on tablets, landscape mode and other larger screens.
  bool _isLargeScreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OrientationBuilder(builder: (context, orientation) {
        _isLargeScreen = MediaQuery.of(context).size.width > 600;
        return Row(children: <Widget>[
          Expanded(
            child: EntryListWidget((index) {
              if (_isLargeScreen) {
                // Show detail for _selectedIndex on the side.
                setState(() {
                  _selectedIndex = index;
                });
              } else {
                // Show detail page separately.
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
              : Container(), // Show empty container if the screen is small.
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

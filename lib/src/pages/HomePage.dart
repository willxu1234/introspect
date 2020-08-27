import 'package:flutter/material.dart';
import 'package:introspect/src/pages/EntryDetailPage.dart';
import 'package:introspect/src/widgets/EntryDetail.dart';
import 'package:introspect/src/widgets/EntryList.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedValue = 0;
  var isLargeScreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OrientationBuilder(builder: (context, orientation) {
        isLargeScreen = MediaQuery.of(context).size.width > 600;

        return Row(children: <Widget>[
          Expanded(
            child: EntryListWidget(10, (value) {
              if (isLargeScreen) {
                selectedValue = value;
                setState(() {});
              } else {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return EntryDetailPage(value);
                  },
                ));
              }
            }),
          ),
          isLargeScreen
              ? Expanded(child: EntryDetailWidget(selectedValue))
              : Container(),
        ]);
      }),
    );
  }
}

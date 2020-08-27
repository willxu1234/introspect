import 'package:flutter/material.dart';
import 'package:introspect/src/widgets/EntryDetail.dart';

class EntryDetailPage extends StatefulWidget {
  final int _data;

  EntryDetailPage(this._data);

  @override
  _EntryDetailPageState createState() => _EntryDetailPageState();
}

class _EntryDetailPageState extends State<EntryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: EntryDetailWidget(widget._data),
    );
  }
}

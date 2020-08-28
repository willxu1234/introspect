import 'package:flutter/material.dart';
import 'package:introspect/widgets/entry_detail.dart';

// Detail page shown when clicking on an entry from the home page, or when the
// size of the viewport is large enough. Shows body text of entry _index.
class EntryDetailPage extends StatefulWidget {
  final int _index;

  EntryDetailPage(this._index);

  @override
  _EntryDetailPageState createState() => _EntryDetailPageState();
}

class _EntryDetailPageState extends State<EntryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: EntryDetailWidget(widget._index),
    );
  }
}

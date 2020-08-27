import 'package:flutter/material.dart';
import 'package:introspect/src/classes/Entry.dart';
import 'package:introspect/src/widgets/AddEntryForm.dart';

typedef void EntryAddedCallback(Entry entry);

class AddEntryPage extends StatefulWidget {
  final EntryAddedCallback _onEntryAdded;

  AddEntryPage(this._onEntryAdded);

  @override
  _AddEntryPageState createState() => _AddEntryPageState();
}

class _AddEntryPageState extends State<AddEntryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AddEntryFormWidget(widget._onEntryAdded),
    );
  }
}

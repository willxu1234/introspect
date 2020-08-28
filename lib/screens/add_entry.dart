import 'package:flutter/material.dart';
import 'package:introspect/widgets/add_entry_form.dart';

class AddEntryPage extends StatefulWidget {
  AddEntryPage();

  @override
  _AddEntryPageState createState() => _AddEntryPageState();
}

class _AddEntryPageState extends State<AddEntryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AddEntryFormWidget(),
    );
  }
}
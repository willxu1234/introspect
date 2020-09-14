import 'package:flutter/material.dart';
import 'package:introspect/widgets/add_entry_form.dart';
import 'package:introspect/widgets/reusable_widgets.dart';

// Page after clicking on add entry button.
class AddEntryPage extends StatefulWidget {
  AddEntryPage();

  @override
  _AddEntryPageState createState() => _AddEntryPageState();
}

class _AddEntryPageState extends State<AddEntryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.getAppBar(),
      body: AddEntryFormWidget(),
    );
  }
}

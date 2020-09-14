import 'package:flutter/material.dart';
import 'package:introspect/widgets/add_entry_form.dart';
import 'package:introspect/widgets/reusable_widgets.dart';

// Page after clicking on add entry button, collects body.
class AddEntryPageOne extends StatefulWidget {
  AddEntryPageOne();

  @override
  _AddEntryPageOneState createState() => _AddEntryPageOneState();
}

class _AddEntryPageOneState extends State<AddEntryPageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.getAppBar(),
      body: AddEntryFormPageOneWidget(),
    );
  }
}

// Page after clicking on add entry button, collects emotion.
class AddEntryPageTwo extends StatefulWidget {
  AddEntryPageTwo();

  @override
  _AddEntryPageTwoState createState() => _AddEntryPageTwoState();
}

class _AddEntryPageTwoState extends State<AddEntryPageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.getAppBar(),
      body: AddEntryFormPageTwoWidget(),
    );
  }
}

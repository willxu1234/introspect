import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introspect/models/emotions.dart';
import 'package:introspect/models/entries.dart';
import 'package:introspect/screens/add_entry.dart';

class AddEntryFormPageOneWidget extends StatefulWidget {
  @override
  _AddEntryFormPageOneWidgetState createState() =>
      _AddEntryFormPageOneWidgetState();
}

class _AddEntryFormPageOneWidgetState extends State<AddEntryFormPageOneWidget> {
  // Form key validates entries.
  final _formKey = GlobalKey<FormState>();
  // Controllers keep track of text boxes.
  final _bodyController = TextEditingController(); // hehe

  @override
  void dispose() {
    // Clean up controllers after user leaves the page.
    _bodyController.dispose();
    super.dispose();
  }

  void submitForm() async {
    if (_formKey.currentState.validate()) {
      // Get the complete new entry once the next routes are done with it.
      Entry newEntry = await Navigator.push(
          context,
          MaterialPageRoute<Entry>(
            builder: (context) {
              return AddEntryPageTwo();
            },
            // Pass the entry with just the body to form two.
            settings: RouteSettings(
              arguments: Entry(null, _bodyController.text, Emotions.wheel),
            ),
          ));
      // Pop back to the original screen returning the complete new entry.
      Navigator.pop(context, newEntry);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Form(
          key: _formKey,
          child:
              ListView(padding: const EdgeInsets.all(16.0), children: <Widget>[
            TextFormField(
              // TODO: Prettify this.
              // Body field.
              textInputAction: TextInputAction.done,
              controller: _bodyController,
              decoration: const InputDecoration(
                hintText: 'Hi there! What did you do today?',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            RaisedButton(
              // Submit button.
              onPressed: submitForm,
              child: Text('Submit'),
            ),
          ]),
        ),
      ),
    );
  }
}

class AddEntryFormPageTwoWidget extends StatefulWidget {
  @override
  _AddEntryFormPageTwoWidgetState createState() =>
      _AddEntryFormPageTwoWidgetState();
}

class _AddEntryFormPageTwoWidgetState extends State<AddEntryFormPageTwoWidget> {
  // Form key validates entries.
  final _formKey = GlobalKey<FormState>();
  // Controllers keep track of text boxes.
  final _bodyController = TextEditingController(); // hehe

  @override
  void dispose() {
    // Clean up controllers after user leaves the page.
    _bodyController.dispose();
    super.dispose();
  }

  void submitForm(Entry newEntryWithBody) {
    if (_formKey.currentState.validate()) {
      // Pop and return the new entry to the Navigator that called it, using the
      // body from form one.
      Navigator.pop(
          context,
          Entry(DateTime.now(), newEntryWithBody.body,
              Emotion(_bodyController.text, Colors.green, {})));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the entry passed in from form one.
    final Entry newEntryWithBody = ModalRoute.of(context).settings.arguments;

    return Material(
      child: Center(
        child: Form(
          key: _formKey,
          child:
              ListView(padding: const EdgeInsets.all(16.0), children: <Widget>[
            TextFormField(
              // TODO: Prettify this.
              // Body field.
              textInputAction: TextInputAction.done,
              controller: _bodyController,
              decoration: const InputDecoration(
                hintText: 'How are you feeling?',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            RaisedButton(
              // Submit button, passes incomplete entry to submitForm().
              onPressed: () {
                submitForm(newEntryWithBody);
              },
              child: Text('Submit'),
            ),
          ]),
        ),
      ),
    );
  }
}

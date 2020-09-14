import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introspect/models/emotions.dart';
import 'package:introspect/models/entries.dart';

class AddEntryFormWidget extends StatefulWidget {
  @override
  _AddEntryFormWidgetState createState() => _AddEntryFormWidgetState();
}

class _AddEntryFormWidgetState extends State<AddEntryFormWidget> {
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

  void submitForm() {
    if (_formKey.currentState.validate()) {
      // Pop and return the new entry to the Navigator that called it.
      Navigator.pop(
          context, Entry(DateTime.now(), _bodyController.text, Emotions.wheel));
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
              // Body field.
              textInputAction: TextInputAction.done,
              controller: _bodyController,
              decoration: const InputDecoration(
                hintText: 'How was your day?',
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

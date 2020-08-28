import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introspect/models/entries.dart';
import 'package:provider/provider.dart';

class AddEntryFormWidget extends StatefulWidget {
  @override
  _AddEntryFormWidgetState createState() => _AddEntryFormWidgetState();
}

class _AddEntryFormWidgetState extends State<AddEntryFormWidget> {
  // Form key validates entries.
  final _formKey = GlobalKey<FormState>();
  // Controllers keep track of text boxes.
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController(); // hehe

  @override
  void dispose() {
    // Clean up controllers after user leaves the page.
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Shortcuts(
          shortcuts: <LogicalKeySet, Intent>{
            // Pressing enter on the field will now move to the next field.
            LogicalKeySet(LogicalKeyboardKey.enter): NextFocusIntent(),
          },
          child: FocusTraversalGroup(
            child: Form(
              key: _formKey,
              onChanged: () {
                Form.of(primaryFocus.context).save();
              },
              child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: <Widget>[
                    // Title field.
                    TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        hintText: 'Enter a title',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      // Body field.
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
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          // Directly adds entry to EntriesModel.
                          Provider.of<EntriesModel>(context, listen: false).add(
                              Entry(_titleController.text, DateTime.now(),
                                  _bodyController.text));
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

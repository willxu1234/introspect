import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introspect/models/entries.dart';
import 'package:provider/provider.dart';

class AddEntryFormWidget extends StatefulWidget {
  @override
  _AddEntryFormWidgetState createState() => _AddEntryFormWidgetState();
}

class _AddEntryFormWidgetState extends State<AddEntryFormWidget> {
  final _formKey = GlobalKey<FormState>();

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
                    TextFormField(
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
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Provider.of<EntriesModel>(context, listen: false)
                              .add(Entry("", DateTime.now(), ""));
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
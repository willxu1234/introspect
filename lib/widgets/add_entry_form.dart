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
              // Body field.
              autofocus: true,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              textInputAction: TextInputAction.done,
              onEditingComplete: submitForm,
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
  Emotion _selectedEmotion;

  void submitForm(Entry newEntryWithBody) async {
    // Don't consider submitting if _selectedEmotion hasn't been set yet.
    if (_selectedEmotion != null) {
      if (_selectedEmotion.children.isNotEmpty &&
          _selectedEmotion != newEntryWithBody.emotion) {
        Entry newEntry = await Navigator.push(
            context,
            MaterialPageRoute<Entry>(
              builder: (context) {
                return AddEntryPageTwo();
              },
              // Pass the entry with just the body to form two.
              settings: RouteSettings(
                arguments: Entry(null, newEntryWithBody.body, _selectedEmotion),
              ),
            ));
        Navigator.pop(context, newEntry);
      } else {
        // Pop and return the new entry to the Navigator that called it, using the
        // body from form one.
        Navigator.pop(context,
            Entry(DateTime.now(), newEntryWithBody.body, _selectedEmotion));
      }
    } else {
      // Display snackbar if no emotion selected.
      final snackBar = SnackBar(
        content: Text('Please select an emotion.'),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the entry passed in from form one.
    final Entry newEntryWithBody = ModalRoute.of(context).settings.arguments;

    return Material(
      child: Center(
        child: ListView(padding: const EdgeInsets.all(16.0), children: <Widget>[
          // Add radio buttons for each child of the current emotion.
          for (Emotion emotion in newEntryWithBody.emotion.children.values)
            RadioListTile<Emotion>(
                title: Text(emotion.name.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: emotion.color)),
                activeColor: newEntryWithBody.emotion.color,
                value: emotion,
                groupValue: _selectedEmotion,
                onChanged: (Emotion selectedEmotion) {
                  setState(() {
                    _selectedEmotion = selectedEmotion;
                  });
                  submitForm(newEntryWithBody);
                }),
          // Show the last selected emotion if it isn't the first time the
          // user has entered form two.
          if (newEntryWithBody.emotion.name != 'default') Divider(),
          if (newEntryWithBody.emotion.name != 'default')
            RadioListTile<Emotion>(
                title: Text(newEntryWithBody.emotion.name.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: newEntryWithBody.emotion.color)),
                activeColor: newEntryWithBody.emotion.color,
                value: newEntryWithBody.emotion,
                groupValue: _selectedEmotion,
                onChanged: (Emotion selectedEmotion) {
                  setState(() {
                    _selectedEmotion = selectedEmotion;
                  });
                  submitForm(newEntryWithBody);
                }),
        ]),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';

import 'emotions.dart';

class Entry {
  DateTime date;
  String body;
  Emotion emotion;

  Entry(this.date, this.body, this.emotion);
}

// Declared with ChangeNotifier so Consumers can efficiently access the global
// Entries from other widgets. The order should always be from oldest to newest,
// i.e. the date of an entry should never change and entries can only be added
// to the end.
class EntriesModel extends ChangeNotifier {
  // final List<Entry> _entries = List<Entry>();

  // Sample entries:
  final List<Entry> _entries = [
    Entry(DateTime.utc(2020, 9, 10), "This is a short entry.",
        Emotions.wheel.children["joy"]),
    Entry(
        DateTime.utc(2020, 9, 9),
        "This is a loooooooooooooooooooooooooooooong entry.",
        Emotions.wheel.children["sadness"]),
    Entry(
        DateTime.utc(2020, 8, 11),
        "This entry is super long. This entry is super long. This entry is super long. This entry is super long. This entry is super long. This entry is super long. This entry is super long. This entry is super long. This entry is super long. This entry is super long. This entry is super long.",
        Emotions.wheel.children["anger"]),
    Entry(DateTime.utc(2020, 8, 11), "This entry is short.",
        Emotions.wheel.children["anger"]),
    Entry(DateTime.utc(2020, 8, 10), "This entry is short.",
        Emotions.wheel.children["joy"]),
    Entry(
        DateTime.utc(2020, 8, 1),
        "This entry has level two emotions and it's somewhat long.",
        Emotions.wheel.children["joy"].children["euphoric"]),
    Entry(DateTime.utc(2020, 7, 15), "This entry also has level two emotions.",
        Emotions.wheel.children["anger"].children["enraged"]),
    Entry(DateTime.utc(2020, 5, 20), "This entry is from longer ago.",
        Emotions.wheel.children["fear"]),
    Entry(DateTime.utc(2020, 5, 19), "This entry is from very long ago.",
        Emotions.wheel.children["surprise"]),
    Entry(DateTime.utc(2020, 4, 10), "This entry is short.",
        Emotions.wheel.children["joy"]),
    Entry(
        DateTime.utc(2019, 8, 1),
        "This entry has level two emotions and it's somewhat long.",
        Emotions.wheel.children["joy"].children["euphoric"]),
    Entry(DateTime.utc(2019, 7, 15), "This entry also has level two emotions.",
        Emotions.wheel.children["anger"].children["enraged"]),
    Entry(DateTime.utc(2019, 5, 20), "This entry is from longer ago.",
        Emotions.wheel.children["fear"]),
    Entry(DateTime.utc(2018, 1, 1), "This entry is from very long ago.",
        Emotions.wheel.children["surprise"]),
    Entry(DateTime.utc(2018, 8, 10), "This entry is short.",
        Emotions.wheel.children["joy"]),
    Entry(
        DateTime.utc(2017, 8, 1),
        "This entry has level two emotions and it's somewhat long.",
        Emotions.wheel.children["joy"].children["euphoric"]),
    Entry(DateTime.utc(2017, 7, 15), "This entry also has level two emotions.",
        Emotions.wheel.children["anger"].children["enraged"]),
    Entry(DateTime.utc(2006, 5, 20), "This entry is from longer ago.",
        Emotions.wheel.children["fear"]),
    Entry(DateTime.utc(1989, 1, 1), "This entry is from very long ago.",
        Emotions.wheel.children["surprise"]),
  ];

  static final Entry _defaultEntry = new Entry(
      null,
      "No entries yet. Make your first one by hitting Compose!",
      Emotions.wheel);

  void add(Entry entry) {
    _entries.add(entry);
    notifyListeners();
  }

  List<Entry> get entries => _entries;

  void editEntry(int id, Entry entry) {
    if (id >= _entries.length) {
      return;
    }
    _entries[id] = entry;
    notifyListeners();
  }

  Entry getEntry(int id) {
    if (id >= _entries.length) {
      return _defaultEntry;
    }
    return _entries[id];
  }

  int get length => _entries.length;

  void remove(int id) {
    if (id >= _entries.length) {
      return;
    }
    _entries.removeAt(id);
    notifyListeners();
  }
}

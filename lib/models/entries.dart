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
  final List<Entry> _entries = List<Entry>();

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

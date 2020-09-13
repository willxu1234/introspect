import 'package:flutter/foundation.dart';

class Entry {
  String title;
  DateTime date;
  String body;

  Entry(this.title, this.date, this.body);
}

// Declared with ChangeNotifier so Consumers can efficiently access the global
// Entries from other widgets.
class EntriesModel extends ChangeNotifier {
  final List<Entry> _entries = List<Entry>();

  static final Entry _defaultEntry = new Entry(
      "No entries yet. Make your first"
          "one by hitting Compose!",
      null,
      "");

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

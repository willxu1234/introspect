import 'package:flutter/foundation.dart';

class Entry {
  String title;
  DateTime date;
  String body;

  Entry(this.title, this.date, this.body);
}

class EntriesModel extends ChangeNotifier {
  final List<Entry> _entries = List<Entry>();

  void add(Entry entry) {
    _entries.add(entry);
    notifyListeners();
  }

  List<Entry> get entries => _entries;

  void editEntry(int id, Entry entry) {
    _entries[id] = entry;
    notifyListeners();
  }

  Entry getEntry(int id) {
    return _entries[id];
  }

  int get length => _entries.length;

  void remove(int id) {
    _entries.removeAt(id);
    notifyListeners();
  }
}

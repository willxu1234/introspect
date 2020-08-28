import 'dart:collection';

import 'package:flutter/foundation.dart';

class Entry {
  String _title;
  DateTime _date;
  String _body;

  Entry(this._title, this._date, this._body);
}

class EntriesModel extends ChangeNotifier {
  final LinkedHashMap<int, Entry> _entries = LinkedHashMap<int, Entry>();
  int _nextId = 0;

  void add(Entry entry) {
    _entries[_nextId] = entry;
    _nextId++;
    notifyListeners();
  }

  LinkedHashMap<int, Entry> get entries => _entries;

  void editEntry(int id, Entry entry) {
    _entries[id] = entry;
  }

  Entry getEntry(int id) {
    return _entries[id];
  }

  int get length => _entries.length;

  void remove(int id) {
    _entries.remove(id);
    notifyListeners();
  }
}

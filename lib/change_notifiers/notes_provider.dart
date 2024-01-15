import 'package:flutter/material.dart';

import '../models/note.dart';

class NotesProvider extends ChangeNotifier {
  final List<Note> _notes = [];

  List<Note> get notes => [..._notes];

  void addNote(Note note) {
    _notes.add(note);
    notifyListeners();
  }

  void updateNote(Note note) {
    final index =
        _notes.indexWhere((element) => element.dateCreated == note.dateCreated);
    _notes[index] = note;
    notifyListeners();
  }
}

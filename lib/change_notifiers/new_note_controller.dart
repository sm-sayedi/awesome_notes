import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';
import 'notes_provider.dart';

class NewNoteController extends ChangeNotifier {
  Note? _note;
  set note(Note? value) {
    _note = value;
    _title = _note!.title ?? '';
    _content = Document.fromJson(jsonDecode(_note!.contentJson));
    _tags.addAll(_note!.tags ?? []);
    notifyListeners();
  }

  Note? get note => _note;

  bool _readOnly = false;
  set readOnly(bool value) {
    _readOnly = value;
    notifyListeners();
  }

  bool get readOnly => _readOnly;

  String _title = '';
  set title(String value) {
    _title = value;
    notifyListeners();
  }

  String get title => _title.trim();

  Document _content = Document();
  set content(Document value) {
    _content = value;
    notifyListeners();
  }

  Document get content => _content;

  final List<String> _tags = [];
  void addTag(String tag) {
    _tags.add(tag);
    notifyListeners();
  }

  List<String> get tags => [..._tags];

  void removeTag(int index) {
    _tags.removeAt(index);
    notifyListeners();
  }

  void updateTag(String tag, int index) {
    _tags[index] = tag;
    notifyListeners();
  }

  bool get isNewNote => _note == null;

  bool get canSaveNote {
    final String? newTitle = title.isNotEmpty ? title : null;
    final String? newContent = content.toPlainText().trim().isNotEmpty
        ? content.toPlainText().trim()
        : null;

    bool canSave = newTitle != null || newContent != null;

    if (!isNewNote) {
      final newContentJson = jsonEncode(content.toDelta().toJson());
      canSave &= newTitle != note!.title ||
          newContentJson != note!.contentJson ||
          !listEquals(tags, note!.tags);
    }

    return canSave;
  }

  void saveNote(BuildContext context) {
    final String? newTitle = title.isNotEmpty ? title : null;
    final String? newContent = content.toPlainText().trim().isNotEmpty
        ? content.toPlainText().trim()
        : null;
    final String contentJson = jsonEncode(_content.toDelta().toJson());
    final int now = DateTime.now().microsecondsSinceEpoch;

    final Note note = Note(
      title: newTitle,
      content: newContent,
      contentJson: contentJson,
      dateCreated: isNewNote ? now : _note!.dateCreated,
      dateModified: now,
      tags: tags,
    );

    final notesProvider = context.read<NotesProvider>();
    isNewNote ? notesProvider.addNote(note) : notesProvider.updateNote(note);
  }
}

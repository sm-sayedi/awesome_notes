import 'package:flutter/material.dart';

import '../models/note.dart';
import 'note_card.dart';

class NotesList extends StatelessWidget {
  const NotesList({
    required this.notes,
    super.key,
  });
  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: notes.length,
      clipBehavior: Clip.none,
      itemBuilder: (context, index) {
        return NoteCard(
          note: notes[index],
          isInGrid: false,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 8),
    );
  }
}

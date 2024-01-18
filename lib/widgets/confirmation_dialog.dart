import 'package:flutter/material.dart';

import 'note_button.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            NoteButton(
              label: 'No',
              onPressed: () => Navigator.pop(context, false),
              isOutlined: true,
            ),
            const SizedBox(width: 8),
            NoteButton(
              label: 'Yes',
              onPressed: () => Navigator.pop(context, true),
            ),
          ],
        ),
      ],
    );
  }
}

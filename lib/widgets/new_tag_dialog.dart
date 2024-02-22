import 'package:flutter/material.dart';

import 'dialog_card.dart';
import 'note_button.dart';
import 'note_form_field.dart';

class NewTagDialog extends StatefulWidget {
  const NewTagDialog({
    super.key,
    this.tag,
  });
  final String? tag;

  @override
  State<NewTagDialog> createState() => _NewTagDialogState();
}

class _NewTagDialogState extends State<NewTagDialog> {
  late final TextEditingController tagController;

  late final GlobalKey<FormFieldState> tagKey;

  @override
  void initState() {
    super.initState();

    tagController = TextEditingController(text: widget.tag);

    tagKey = GlobalKey();
  }

  @override
  void dispose() {
    tagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DialogCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Add tag',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 24),
          NoteFormField(
            key: tagKey,
            controller: tagController,
            hintText: 'Add tag (< 16 characters)',
            validator: (value) {
              if (value!.trim().isEmpty) {
                return 'No tags added';
              } else if (value.trim().length > 16) {
                return 'Tags should not be more than 16 characters';
              }
              return null;
            },
            onChanged: (newValue) {
              tagKey.currentState?.validate();
            },
            autofocus: true,
          ),
          const SizedBox(height: 24),
          NoteButton(
            child: const Text('Add'),
            onPressed: () {
              if (tagKey.currentState?.validate() ?? false) {
                Navigator.pop(context, tagController.text.trim());
              }
            },
          ),
        ],
      ),
    );
  }
}

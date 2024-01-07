import 'package:awesome_notes/change_notifiers/new_note_controller.dart';
import 'package:awesome_notes/core/constants.dart';
import 'package:awesome_notes/widgets/note_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../widgets/note_icon_button_outlined.dart';
import '../widgets/note_toolbar.dart';

class NewOrEditNotePage extends StatefulWidget {
  const NewOrEditNotePage({
    required this.isNewNote,
    super.key,
  });

  final bool isNewNote;

  @override
  State<NewOrEditNotePage> createState() => _NewOrEditNotePageState();
}

class _NewOrEditNotePageState extends State<NewOrEditNotePage> {
  late final NewNoteController newNoteController;
  late final QuillController quillController;

  late final FocusNode focusNode;

  @override
  void initState() {
    super.initState();

    newNoteController = context.read<NewNoteController>();

    quillController = QuillController.basic();

    focusNode = FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.isNewNote) {
        focusNode.requestFocus();
        newNoteController.readOnly = false;
      } else {
        newNoteController.readOnly = true;
      }
    });
  }

  @override
  void dispose() {
    quillController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: NoteIconButtonOutlined(
            icon: FontAwesomeIcons.chevronLeft,
            onPressed: () {
              Navigator.maybePop(context);
            },
          ),
        ),
        title: Text(widget.isNewNote ? 'New Note' : 'Edit Note'),
        actions: [
          Selector<NewNoteController, bool>(
            selector: (context, newNoteController) =>
                newNoteController.readOnly,
            builder: (context, readOnly, child) => NoteIconButtonOutlined(
              icon: readOnly ? FontAwesomeIcons.pen : FontAwesomeIcons.bookOpen,
              onPressed: () {
                newNoteController.readOnly = !readOnly;

                if (newNoteController.readOnly) {
                  FocusScope.of(context).unfocus();
                } else {
                  focusNode.requestFocus();
                }
              },
            ),
          ),
          NoteIconButtonOutlined(
            icon: FontAwesomeIcons.check,
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Selector<NewNoteController, bool>(
              selector: (context, controller) => controller.readOnly,
              builder: (context, readOnly, child) => TextField(
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  hintText: 'Title here',
                  hintStyle: TextStyle(
                    color: gray300,
                  ),
                  border: InputBorder.none,
                ),
                canRequestFocus: !readOnly,
              ),
            ),
            if (!widget.isNewNote) ...[
              const Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Last Modified',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: gray500,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                      '07 December 2023, 03:35 PM',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: gray900,
                      ),
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Created',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: gray500,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                      '06 December 2023, 03:35 PM',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: gray900,
                      ),
                    ),
                  ),
                ],
              ),
            ],
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      const Text(
                        'Tags',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: gray500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      NoteIconButton(
                        icon: FontAwesomeIcons.circlePlus,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  flex: 5,
                  child: Text(
                    'No tags added',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: gray900,
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(color: gray500, thickness: 2),
            ),
            Expanded(
              child: Selector<NewNoteController, bool>(
                selector: (_, controller) => controller.readOnly,
                builder: (_, readOnly, __) => Column(
                  children: [
                    Expanded(
                      child: QuillEditor.basic(
                        configurations: QuillEditorConfigurations(
                          controller: quillController,
                          placeholder: 'Note here...',
                          expands: true,
                          readOnly: readOnly,
                        ),
                        focusNode: focusNode,
                      ),
                    ),
                    if (!readOnly) NoteToolbar(controller: quillController),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

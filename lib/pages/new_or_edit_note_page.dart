import 'package:awesome_notes/core/constants.dart';
import 'package:awesome_notes/widgets/note_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  late final QuillController quillController;

  late final FocusNode focusNode;

  late bool readOnly;

  @override
  void initState() {
    super.initState();

    quillController = QuillController.basic();

    focusNode = FocusNode();

    if (widget.isNewNote) {
      focusNode.requestFocus();
      readOnly = false;
    } else {
      readOnly = true;
    }
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
          NoteIconButtonOutlined(
            icon: readOnly ? FontAwesomeIcons.pen : FontAwesomeIcons.bookOpen,
            onPressed: () {
              setState(() {
                readOnly = !readOnly;

                if (readOnly) {
                  FocusScope.of(context).unfocus();
                } else {
                  focusNode.requestFocus();
                }
              });
            },
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
            const TextField(
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                hintText: 'Title here',
                hintStyle: TextStyle(
                  color: gray300,
                ),
                border: InputBorder.none,
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
              child: QuillProvider(
                configurations:
                    QuillConfigurations(controller: quillController),
                child: Column(
                  children: [
                    Expanded(
                      child: QuillEditor.basic(
                        configurations: QuillEditorConfigurations(
                          placeholder: 'Note here...',
                          expands: true,
                          readOnly: readOnly,
                        ),
                        focusNode: focusNode,
                      ),
                    ),
                    if (!readOnly) const NoteToolbar(),
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

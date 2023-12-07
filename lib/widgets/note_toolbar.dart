import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../core/constants.dart';

class NoteToolbar extends StatelessWidget {
  const NoteToolbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: white,
        border: Border.all(
          color: primary,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: primary,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: const QuillToolbar(
        configurations: QuillToolbarConfigurations(
          multiRowsDisplay: false,
          showFontFamily: false,
          showFontSize: false,
          showSubscript: false,
          showSuperscript: false,
          showSmallButton: false,
          showInlineCode: false,
          showAlignmentButtons: false,
          showDirection: false,
          showDividers: false,
          showHeaderStyle: false,
          showListCheck: false,
          showCodeBlock: false,
          showQuote: false,
          showIndent: false,
          showLink: false,
          buttonOptions: QuillToolbarButtonOptions(
            undoHistory: QuillToolbarHistoryButtonOptions(
              isUndo: true,
              iconData: FontAwesomeIcons.arrowRotateLeft,
              iconSize: 22,
            ),
            redoHistory: QuillToolbarHistoryButtonOptions(
              isUndo: false,
              iconData: FontAwesomeIcons.arrowRotateRight,
              iconSize: 22,
            ),
            bold: QuillToolbarToggleStyleButtonOptions(
              iconData: FontAwesomeIcons.bold,
              iconSize: 22,
            ),
            italic: QuillToolbarToggleStyleButtonOptions(
              iconData: FontAwesomeIcons.italic,
              iconSize: 22,
            ),
            underLine: QuillToolbarToggleStyleButtonOptions(
              iconData: FontAwesomeIcons.underline,
              iconSize: 22,
            ),
            strikeThrough: QuillToolbarToggleStyleButtonOptions(
              iconData: FontAwesomeIcons.strikethrough,
              iconSize: 22,
            ),
            color: QuillToolbarColorButtonOptions(
              iconData: FontAwesomeIcons.palette,
              iconSize: 22,
            ),
            backgroundColor: QuillToolbarColorButtonOptions(
              iconData: FontAwesomeIcons.fillDrip,
              iconSize: 22,
            ),
            clearFormat: QuillToolbarClearFormatButtonOptions(
              iconData: FontAwesomeIcons.textSlash,
              iconSize: 22,
            ),
            listNumbers: QuillToolbarToggleStyleButtonOptions(
              iconData: FontAwesomeIcons.listOl,
              iconSize: 22,
            ),
            listBullets: QuillToolbarToggleStyleButtonOptions(
              iconData: FontAwesomeIcons.listUl,
              iconSize: 22,
            ),
            search: QuillToolbarSearchButtonOptions(
              iconData: FontAwesomeIcons.magnifyingGlass,
              iconSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}

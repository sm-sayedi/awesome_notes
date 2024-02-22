import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'note_icon_button_outlined.dart';

class NoteBackButton extends StatelessWidget {
  const NoteBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: NoteIconButtonOutlined(
        icon: FontAwesomeIcons.chevronLeft,
        onPressed: () {
          Navigator.maybePop(context);
        },
      ),
    );
  }
}

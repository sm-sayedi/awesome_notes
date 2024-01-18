import 'package:flutter/material.dart';

import '../widgets/confirmation_dialog.dart';
import '../widgets/dialog_card.dart';
import '../widgets/new_tag_dialog.dart';

Future<String?> showNewTagDialog({
  required BuildContext context,
  String? tag,
}) {
  return showDialog<String?>(
    context: context,
    builder: (context) => DialogCard(child: NewTagDialog(tag: tag)),
  );
}

Future<bool?> showConfirmationDialog({
  required BuildContext context,
  required String title,
}) {
  return showDialog<bool?>(
    context: context,
    builder: (_) => DialogCard(child: ConfirmationDialog(title: title)),
  );
}

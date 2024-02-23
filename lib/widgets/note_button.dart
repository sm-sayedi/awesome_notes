import 'package:flutter/material.dart';

import '../core/constants.dart';

class NoteButton extends StatelessWidget {
  const NoteButton({
    super.key,
    required this.child,
    this.onPressed,
    this.isOutlined = false,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 2),
            color: isOutlined ? primary : black,
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutlined ? white : primary,
          foregroundColor: isOutlined ? primary : white,
          disabledBackgroundColor: gray300,
          disabledForegroundColor: black,
          side: BorderSide(color: isOutlined ? primary : black),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: child,
      ),
    );
  }
}

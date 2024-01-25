import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../change_notifiers/notes_provider.dart';
import '../core/constants.dart';
import '../enums/order_option.dart';
import 'note_icon_button.dart';

class ViewOptions extends StatefulWidget {
  const ViewOptions({super.key});

  @override
  State<ViewOptions> createState() => _ViewOptionsState();
}

class _ViewOptionsState extends State<ViewOptions> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NotesProvider>(
      builder: (_, notesProvider, __) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            NoteIconButton(
              icon: notesProvider.isDescending
                  ? FontAwesomeIcons.arrowDown
                  : FontAwesomeIcons.arrowUp,
              size: 18,
              onPressed: () {
                setState(() {
                  notesProvider.isDescending = !notesProvider.isDescending;
                });
              },
            ),
            const SizedBox(width: 16),
            DropdownButton<OrderOption>(
              value: notesProvider.orderBy,
              icon: const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: FaIcon(
                  FontAwesomeIcons.arrowDownWideShort,
                  size: 18,
                  color: gray700,
                ),
              ),
              underline: const SizedBox.shrink(),
              borderRadius: BorderRadius.circular(16),
              isDense: true,
              items: OrderOption.values
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Row(
                        children: [
                          Text(e.name),
                          if (e == notesProvider.orderBy) ...[
                            const SizedBox(width: 8),
                            const Icon(Icons.check),
                          ],
                        ],
                      ),
                    ),
                  )
                  .toList(),
              selectedItemBuilder: (context) =>
                  OrderOption.values.map((e) => Text(e.name)).toList(),
              onChanged: (newValue) {
                setState(() {
                  notesProvider.orderBy = newValue!;
                });
              },
            ),
            const Spacer(),
            NoteIconButton(
              icon: notesProvider.isGrid
                  ? FontAwesomeIcons.tableCellsLarge
                  : FontAwesomeIcons.bars,
              size: 18,
              onPressed: () {
                setState(() {
                  notesProvider.isGrid = !notesProvider.isGrid;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

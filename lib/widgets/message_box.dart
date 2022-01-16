import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathmaker/constants.dart';
import 'package:pathmaker/main.dart';

class MessageBox extends ConsumerWidget {
  MessageBox({required this.contents, required this.id});

  final Widget contents;
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: Column(
        children: [
          contents,
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            TextButton(
              onPressed: id == 0
                  ? null
                  : () {
                      ref
                          .read(dataCoordinatorProvider.notifier)
                          .previousMessage();
                    },
              child: Text('Previous'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return kDividerColour;
                  } else {
                    return Colors.blue.shade800;
                  }
                }),
                overlayColor: MaterialStateProperty.all(
                  Color(0x20607D8B),
                ),
              ),
            ),
            TextButton(
              onPressed: ref
                      .watch(dataCoordinatorProvider)
                      .messageIsCompleteStatus[id]!
                  ? () {
                      ref.read(dataCoordinatorProvider.notifier).nextMessage();
                      ref
                          .read(dataCoordinatorProvider.notifier)
                          .buttonFunction(id);
                    }
                  : null,
              child: Text(
                'Next',
              ),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return kDividerColour;
                  } else {
                    return Colors.blue.shade800;
                  }
                }),
                overlayColor: MaterialStateProperty.all(
                  Color(0x20607D8B),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathmaker/main.dart';

class MessageBox extends ConsumerStatefulWidget {
  MessageBox({required this.contents, required this.id});

  final Widget contents;
  final int id;

  @override
  _MessageBoxState createState() => _MessageBoxState();
}

class _MessageBoxState extends ConsumerState<MessageBox> {
  bool isDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.contents,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                TextButton(
                    onPressed: () {
                      ref
                          .read(dataCoordinatorProvider.notifier)
                          .previousMessage();
                    },
                    child: Text('Previous')),
                TextButton(
                  onPressed: isDisabled
                      ? null
                      : ref
                              .watch(dataCoordinatorProvider)
                              .messageIsCompleteStatus[widget.id]!
                          ? () {
                              setState(() {
                                isDisabled = true;
                              });
                              ref
                                  .read(dataCoordinatorProvider.notifier)
                                  .nextMessage();
                              ref
                                  .read(dataCoordinatorProvider)
                                  .initialiseAncestry();
                            }
                          : null,
                  child: Text('Next'),
                ),
              ]),
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}

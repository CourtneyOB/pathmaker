import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathmaker/main.dart';

class MessageBox extends ConsumerStatefulWidget {
  MessageBox(
      {required this.contents, required this.id, this.isDisabled = false});

  final Widget contents;
  final int id;
  bool isDisabled;

  @override
  _MessageBoxState createState() => _MessageBoxState();
}

class _MessageBoxState extends ConsumerState<MessageBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.contents,
                Container(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: widget.isDisabled
                        ? null
                        : () {
                            setState(() {
                              widget.isDisabled = true;
                            });
                            ref.read(dataCoordinatorProvider).nextMessage();
                            ref
                                .read(dataCoordinatorProvider)
                                .updateSelections();
                          },
                    child: Text('Next'),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}

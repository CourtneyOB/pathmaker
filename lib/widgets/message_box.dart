import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathmaker/main.dart';

class MessageBox extends ConsumerWidget {
  MessageBox({required this.contents});

  final Widget contents;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Card(
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                contents,
                Container(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      ref.read(messageProvider).nextMessage();
                      //TODO: Needs to have some optional way of undertaking the function of the box
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

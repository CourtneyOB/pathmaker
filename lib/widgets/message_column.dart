import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathmaker/main.dart';
import 'package:pathmaker/widgets/message_box.dart';

class MessageColumn extends ConsumerWidget {
  const MessageColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<MessageBox> messages =
        ref.watch(dataCoordinatorProvider).currentMessages;

    return Flexible(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.001),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: messages,
        ),
      ),
    );
  }
}

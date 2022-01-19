import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathmaker/main.dart';
import 'package:pathmaker/model/message.dart';

class MessageColumn extends ConsumerWidget {
  const MessageColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Message> messages =
        ref.watch(dataCoordinatorProvider).currentMessages;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.001),
      child: ExpansionPanelList(
        key:
            ValueKey(ref.watch(dataCoordinatorProvider).currentMessages.length),
        expansionCallback: (int index, bool isExpanded) {
          ref.read(dataCoordinatorProvider.notifier).expandMessage(index);
        },
        children: messages.map<ExpansionPanel>((Message message) {
          return ExpansionPanel(
            hasIcon: false,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(message.headerValue),
              );
            },
            body: message.expandedValue,
            isExpanded: message.isExpanded,
          );
        }).toList(),
      ),
    );
  }
}

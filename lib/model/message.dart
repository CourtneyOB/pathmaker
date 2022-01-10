import 'package:flutter/material.dart';

class Message {
  String headerValue;
  Widget expandedValue;
  bool isExpanded;

  Message(
      {required this.headerValue,
      required this.expandedValue,
      this.isExpanded = true});
}

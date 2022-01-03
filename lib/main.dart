import 'package:flutter/material.dart';
import 'screens/homepage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathmaker/model/character.dart';
import 'package:pathmaker/services/message_service.dart';

final dataProvider = ChangeNotifierProvider((ref) => Character());
final messageProvider = ChangeNotifierProvider((ref) => MessageService());

void main() {
  runApp(
    ProviderScope(child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

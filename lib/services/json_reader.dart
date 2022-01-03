import 'dart:convert';
import 'package:flutter/services.dart';

class MyJsonReader {
  static Future<Map<String, dynamic>> loadJson(String assetPath) async {
    String data = await rootBundle.loadString(assetPath);
    return json.decode(data);
  }
}

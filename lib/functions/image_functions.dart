import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

Future<String> convertImageToBase64(String imagePath) async {
  final File imageFile = File(imagePath);

  final List<int> imageBytes = await imageFile.readAsBytes();
  String base64String = base64Encode(imageBytes);

  return base64String;
}

Uint8List convertBase64ToImage(String base64String) {
  return base64Decode(base64String);
}

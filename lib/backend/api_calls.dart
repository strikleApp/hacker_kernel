import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hacker_kernel/constants/shared_prefs_keys.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiCalls {
  final String baseUrl = "https://reqres.in/api";

  Future<bool> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/login"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print("Login successful: $responseData");
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(kToken, responseData['token']);
        return true;
      } else {
        print("Login failed: ${response.statusCode} - ${response.body}");
        Map errorMap = jsonDecode(response.body);

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(errorMap["error"].toString().toUpperCase())));
        }
        return false;
      }
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }
}

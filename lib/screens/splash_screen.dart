import 'package:flutter/material.dart';
import 'package:hacker_kernel/constants/shared_prefs_keys.dart';
import 'package:hacker_kernel/repository/provider_function.dart';
import 'package:hacker_kernel/screens/home_screen.dart';
import 'package:hacker_kernel/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

late SharedPreferences prefs;

late Future<void> getFuture;
String token = "";

class _SplashScreenState extends State<SplashScreen> {
  Future<void> getInitial() async {
    try {
      prefs = await SharedPreferences.getInstance();
      token = prefs.getString(kToken) ?? '';
      if (mounted) {
        await Provider.of<ProviderFunction>(context, listen: false)
            .getAllProducts();
      }
      await Future.delayed(Duration(seconds: 2));
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getFuture = getInitial();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: getFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Welcome to Hacker Kernel',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const CircularProgressIndicator(),
                ],
              ),
            ),
          );
        } else if (token.isNotEmpty) {
          return const HomeScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}

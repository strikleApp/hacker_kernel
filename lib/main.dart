import 'package:flutter/material.dart';
import 'package:hacker_kernel/constants/color.dart';
import 'package:hacker_kernel/repository/provider_function.dart';
import 'package:hacker_kernel/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderFunction(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hacker Kernel',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          scaffoldBackgroundColor: Color(0xffffffff),
          appBarTheme: AppBarTheme(
            color: Color(0xffffffff),
            surfaceTintColor: Color(0xffffffff),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              minimumSize: WidgetStatePropertyAll(Size(25, 55)),
              backgroundColor: WidgetStatePropertyAll(primaryColor),
              foregroundColor: WidgetStatePropertyAll(secondaryColor),
            ),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

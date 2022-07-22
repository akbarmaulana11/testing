import 'package:chattingan/app_theme.dart';
import 'package:chattingan/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chattingku",
      debugShowCheckedModeBanner: false,
      theme: lightThemeDataMode(context),
      darkTheme: darkThemeDataMode(context),
      home: WelcomeScreen(),
    );
  }
}

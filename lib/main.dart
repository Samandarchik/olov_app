import 'package:flutter/material.dart';
import 'package:olov_app/login/page/login.dart';
import 'package:olov_app/style/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: kWhite),
        scaffoldBackgroundColor: kWhite,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

 

import 'package:expencesapp/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.purple,
        textTheme: GoogleFonts.emilysCandyTextTheme(),
        // ignore: deprecated_member_use
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        textTheme: GoogleFonts.emilysCandyTextTheme(),
      ),
      themeMode: ThemeMode.light,
      home: const Home(),
    );
  }
}

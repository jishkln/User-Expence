import 'package:expencesapp/controller/transation_controller.dart';
import 'package:expencesapp/home.dart';
import 'package:expencesapp/services/theme_services.dart';
import 'package:expencesapp/utils/theme_constant.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Expance App',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeServices().theme,
      home: const Home(),
    );
  }
}

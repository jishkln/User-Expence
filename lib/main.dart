import 'package:expencesapp/home.dart';
import 'package:expencesapp/services/theme_services.dart';
import 'package:expencesapp/utils/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expance App',
      theme: lightThemeDataCustom,
      darkTheme: darkThemeDataCustom,
      themeMode: ThemeServices().theme,
      home: const Home(),
    );
  }
}

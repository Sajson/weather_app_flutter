import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/screens/home_screen.dart';

void main() {
  GoogleFonts.config.allowRuntimeFetching = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Root of the application
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.ubuntuTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const HomeScreen(),
      title: "Weather App",
      debugShowCheckedModeBanner: false,
    );
  }
}

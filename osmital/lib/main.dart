import 'package:flutter/material.dart';
import 'package:osmital/screen/about_page_screen.dart';
import 'package:osmital/screen/emergency_screen.dart';
import 'package:osmital/screen/home_screen.dart';
import 'package:osmital/screen/map_screen.dart';
import 'package:osmital/screen/test_screen.dart';
import 'package:osmital/screen/upload_image_screen.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import 'provider/osmital_data_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => OsmitalData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          // "/home": (context) => const HomeScreen(),
          // "/": (context) => const MapPage(),
          "/": (context) => HomeScreen(),
          "/AboutPage": (context) => const AboutPage(),
          "/EmergencyPage": (context) => const EmergencyPage(),
          "/UploadImage": (context) => const UploadImage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2, milliseconds: 500),
        () => Navigator.pushReplacementNamed(context, "/home"));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.green,
        child: Image.asset("Assets/Images/hospita.png"),
      ),
    );
  }
}

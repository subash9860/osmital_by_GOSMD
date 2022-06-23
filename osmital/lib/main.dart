import 'package:flutter/material.dart';
import 'package:osmital/screen/about_page_screen.dart';
import 'package:osmital/screen/emergency_screen.dart';
import 'package:osmital/screen/home_screen.dart';
import 'package:osmital/screen/test_screen.dart';
import 'package:osmital/screen/upload_image_screen.dart';
import 'package:osmital/theme.dart';
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
        home: const MyHomePage(),
        theme: OsmitalTheme.light(),
        debugShowCheckedModeBanner: false,
        routes: {
          "/home": (context) => const HomeScreen(),
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
    Timer(const Duration(seconds: 3, milliseconds: 500),
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
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 200,
                width: 200,
                child: Image.asset("Assets/Images/hospital.png")),
            RichText(
              text: const TextSpan(
                text: "OSM",
                style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0061FF)),
                children: [
                  TextSpan(
                    text: "ital",
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import 'provider/osmital_data_provider.dart';

import '../provider/bato_search.dart';
import '../provider/location_permision.dart';
import '../screen/about_page_screen.dart';
import '../screen/emergency_screen.dart';
import '../screen/home_screen.dart';
import '../screen/map_screen.dart';
import '../screen/test_screen.dart';
import '../screen/upload_image_screen.dart';
import '../theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => OsmitalData(),
        ),
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => LocationProvider(),
        ),
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => BatoSearchHospital(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: OsmitalTheme.light(),
        routes: {
          "/home": (context) => const HomeScreen(),
          // "/": (context) => const MapPage(),
          // "/": (context) => TestScreen(),
          "/": (context) => const MyHomePage(),
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
    Provider.of<LocationProvider>(context, listen: false)
        .getLocationPermission();
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
    Provider.of<LocationProvider>(context, listen: false)
        .getLocationPermission();
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

import 'package:flutter/material.dart';
import 'package:osmital/screen/splash_screen.dart';
import 'package:provider/provider.dart';

import '../provider/osmital_data_provider.dart';
import '../screen/about_page_screen.dart';
import '../screen/emergency_screen.dart';
import '../screen/home_screen.dart';
// import '../screen/upload_image_screen.dart';
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
          create: (_) => OsmitalData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: OsmitalTheme.light(),
        routes: {
          "/": (context) => const SplashScreen(),
          "/home": (context) => const HomeScreen(),
          "/AboutPage": (context) => const AboutPage(),
          "/EmergencyPage": (context) => const EmergencyPage(),
          // "/UploadImage": (context) => const UploadImage(),
        },
      ),
    );
  }
}

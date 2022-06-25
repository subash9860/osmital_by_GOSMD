import 'package:flutter/material.dart';
import 'package:osmital/provider/location_permision.dart';
import 'package:osmital/screen/hospital_screen.dart';
import 'package:osmital/screen/map_screen.dart';
import 'package:osmital/screen/test_screen.dart';
import 'package:provider/provider.dart';

import 'emergency.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List page = [
    MapScreen(),
    EmergencyPage(),
    TestScreen(),
  ];
  int pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<LocationProvider>(context, listen: false)
        .getLocationPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OSMital"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Theme.of(context).primaryColor,
          labelTextStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        child: NavigationBar(
          height: 60,
          backgroundColor: Colors.lightBlue[70],
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: const Duration(milliseconds: 1200),
          selectedIndex: pageIndex,
          onDestinationSelected: (int pageIndex) {
            setState(() {
              this.pageIndex = pageIndex;
            });
          },
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.location_on),
              icon: Icon(Icons.location_on_outlined),
              label: "Map",
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.location_city),
              icon: Icon(Icons.location_city_outlined),
              label: "Hospital",
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.settings),
              icon: Icon(Icons.settings_outlined),
              label: "Profile",
            ),
          ],
        ),
      ),
      body: page[pageIndex],
    );
  }
}

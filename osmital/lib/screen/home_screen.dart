import 'package:flutter/material.dart';
import 'package:osmital/provider/location_permision.dart';
import 'package:osmital/screen/hospital_screen.dart';
import 'package:osmital/screen/map_screen.dart';
import 'package:provider/provider.dart';
import '../provider/osmital_data_provider.dart';
// import './about_page_screen.dart';
// import './emergency_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List screenList = const [
    MapPage(),
    HospitalScreen(),
    Text("emergency"),
  ];
  int currentIndex = 0;
  @override
  void initState() {
    Provider.of<LocationProvider>(context, listen: false)
        .getLocationPermission();
    Provider.of<LocationProvider>(context, listen: false)
        .getCurrentLocation()
        .then((value) {
      // Provider.of<OsmitalData>(context, listen: false)
          // .postOsmitalData(27.14,85.32);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 3,
            foregroundColor: Colors.blue,
            backgroundColor: Colors.white,
            title: const Text(
              "OSMital",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Stack(children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: Image.asset(
                          "Assets/Images/hospital.png",
                          scale: 2,
                        )),
                  ]),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.home_filled),
                    title: const Text(
                      'About OSMital',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/AboutPage");
                    },
                  ),
                ),
              ],
            ),
          ),
          body: screenList[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: 'Map',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_hospital_sharp),
                label: 'Hospital',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.ring_volume),
                label: 'Emergency',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

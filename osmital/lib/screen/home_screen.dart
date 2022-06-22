import 'package:flutter/material.dart';
import 'about_page_screen.dart';
import 'emergency_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Color> colors = [
    Colors.redAccent,
    Colors.green,
    Colors.blueAccent,
    Colors.red
  ];
  List text = ["Emergency", "Inform-Police", "bla bla bla", "bla bla bla"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 3,
            backgroundColor: Colors.green,
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
          body: Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 10, right: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 90,
                  child: Center(
                    child: Card(
                      elevation: 1,
                      child: Text(
                        '\"Everyone don\'t know every hospital but OSMital knows\"',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 500,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/EmergencyPage");
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 4,
                          child: Container(
                            decoration: BoxDecoration(
                              color: colors[0],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text(
                              text[0],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/UploadImage");
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 4,
                          child: Container(
                            decoration: BoxDecoration(
                              color: colors[1],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text(
                              text[1],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          //TODO:Adding navigator
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 4,
                          child: Container(
                            decoration: BoxDecoration(
                              color: colors[2],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text(
                              text[2],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          //TODO:Adding navigator
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 4,
                          child: Container(
                            decoration: BoxDecoration(
                              color: colors[3],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text(
                              text[3],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

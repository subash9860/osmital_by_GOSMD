import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor:const Color.fromARGB(26, 243, 229, 229),
        appBar: AppBar(
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.green,
          title: const Text(
            "About OSMital",
          ),
          centerTitle: true,
        ),
        body: const Card(
          margin: EdgeInsets.all(20),
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "OSMital is an open opensource project Osmital provides the information about the hospitals near your area by utilizing the Data provided by the Open Street Map i.e. OSM.\n \nThe main idea of our project is to help those who need special health services or emergency services.This idea came to our mind when we were discussing about the problems in Nepal which were related to health services.\n And the health services in Nepal are not that good and people are suffering a lot because of mismanagement and lack of use of technologies.\n\n So we decided to make something that is useful and makes health services techie and more managed.  We thought this may help a lot of those who are new to the place or who are looking for emergency services in the town. \n",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ),
    );
  }
}

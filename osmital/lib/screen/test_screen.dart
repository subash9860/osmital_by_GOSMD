import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../provider/osmital_data_provider.dart';
import '../screen/testoutput.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  bool _isLoading = true;

  late Position position;

  Future getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    print(position);
  }

  @override
  void initState() {
    getCurrentLocation().then((_) {
      Provider.of<OsmitalData>(context, listen: false)
          .postOsmitalData(position.longitude, position.latitude)
          .then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Provider.of<OsmitalData>(context, listen: false)
                    .getOsmitalData();
              },
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
              ),
              child: const Center(child: Text('get request')),
            ),
            ElevatedButton(
              onPressed: () {
                print("long :${position.longitude}");
                print("lat :${position.latitude}");

                Provider.of<OsmitalData>(context, listen: false)
                    .postOsmitalData(position.longitude, position.latitude);

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TestOutPut(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
              ),
              child: const Center(child: Text('post request')),
            ),
          ],
        ),
      ),
    );
  }
}

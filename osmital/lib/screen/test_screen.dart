import 'package:flutter/material.dart';
import 'package:osmital/provider/osmital_data_provider.dart';
import 'package:osmital/screen/testoutput.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

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
              child: const Center(child: Text('get request')),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<OsmitalData>(context, listen: false)
                    .postOsmitalData(27.71, 85.32);

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TestOutPut(),
                  ),
                );
              },
              child: const Center(child: Text('post request')),
            ),
          ],
        ),
      ),
    );
  }
}

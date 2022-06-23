import 'package:flutter/material.dart';
import 'package:osmital/provider/osmital_data_provider.dart';
import 'package:provider/provider.dart';

class TestOutPut extends StatelessWidget {
  const TestOutPut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<OsmitalData>(
          builder: (context, osmitalData, _) => ListView.builder(
            itemBuilder: (context, index) => Column(
              children: [
                Text('Name: \t ${osmitalData.items[index].name}'),
                Text('Dis:\t  ${osmitalData.items[index].description}'),
              ],
            ),
            itemCount: osmitalData.items.length,
          ),
        ),
      ),
    );
  }
}

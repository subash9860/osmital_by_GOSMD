import 'package:flutter/material.dart';
import '../provider/osmital_data_provider.dart';
import 'package:provider/provider.dart';

class TestOutPut extends StatelessWidget {
  const TestOutPut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: (Provider.of<OsmitalData>(context, listen: false).itemCount == 0)
            ? const Text('No data')
            : Consumer<OsmitalData>(
                builder: (context, osmitalData, _) => ListView.builder(
                    itemCount: osmitalData.items.length,
                    itemBuilder: (context, index) {
                      return (osmitalData.items.isNotEmpty)
                          ? Column(
                              children: [
                                Text(
                                    'Name: \t ${osmitalData.items[index].name}'),
                                Text(
                                    'Description:\t  ${osmitalData.items[index].description}'),
                              ],
                            )
                          : const Text('unable to get data form server');
                    }),
              ),
      ),
    );
  }
}

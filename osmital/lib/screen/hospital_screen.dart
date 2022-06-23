import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:osmital/model/osmital_model.dart';
import 'package:osmital/provider/osmital_data_provider.dart';
import 'package:provider/provider.dart';

import '../provider/location_permision.dart';
import '../widget/bottom_modal_sheet.dart';

class HospitalScreen extends StatefulWidget {
  const HospitalScreen({Key? key}) : super(key: key);

  @override
  State<HospitalScreen> createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
  Position? position;
  final MapController _mapController = MapController();

  // get Location Permission function ask for permission to access location data from the device

  // get current location function get the current location of the device
  // getCurrentLocation() async {
  //   // ignore: non_constant_identifier_names
  //   Position newPosition = await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.high,
  //   );
  //   setState(() {
  //     position = newPosition;
  //     mapController.move(LatLng(position!.latitude, position!.longitude), 16);
  //   });

  // log is use only for printing in debuging mode.
  // log("position: ${position.toString()}");
  // }

  @override
  void initState() {
    // getLocationPermission();
    // getCurrentLocation();
    // sub = mapController.changeFeed.listen((change) => setState(() {}));

    // Provider.of<OsmitalData>(context, listen: false).getOsmitalData();

    Provider.of<LocationProvider>(context, listen: false)
        .getCurrentLocation()
        .then((value) {
      setState(() {
        position = value;
        _mapController.move(
            LatLng(position!.latitude, position!.longitude), 16);
        // Provider.of<OsmitalData>(context, listen: false)
        //     .postOsmitalData(27.14, 85.34);
      });
    });

    // log('${Provider.of<OsmitalData>(context, listen: false).items[0].lat.toString()}');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final Osmital os =
    // Provider.of<OsmitalData>(context, listen: false).items[0];

    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            center: LatLng(position?.latitude ?? 27, position?.longitude ?? 84),
            zoom: 10.0,
          ),
          layers: [
            TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(
                    position?.latitude ?? 27,
                    position?.longitude ?? 54,
                    // Provider.of<OsmitalData>(context, listen: false)
                    // .items[0]
                    // .lat as double,
                    // Provider.of<OsmitalData>(context, listen: false)
                    // .items[0]
                    // .lng as double,

                    // .latitude,
                  ),
                  builder: (ctx) => const Icon(
                    Icons.location_on,
                    size: 30,
                    color: Colors.blue,
                  ),
                ),
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(
                    position?.latitude ?? 27,
                    position?.longitude ?? 54,
                    // double.parse(os.lat),
                    // double.parse(os.lng),
                    // Provider.of<OsmitalData>(context, listen: false)
                    // .items[0]
                    // .lat as double,
                    // Provider.of<OsmitalData>(context, listen: false)
                    // .items[0]
                    // .lng as double,

                    // .latitude,
                  ),
                  builder: (ctx) => const Icon(
                    Icons.location_on,
                    size: 30,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            Provider.of<OsmitalData>(context, listen: false)
                .postOsmitalData(85.34, 27.14);
          },
          child: Text('Post Data'),
        ),
        // ElevatedButton(
        //   onPressed: () {
        //     Provider.of<OsmitalData>(context, listen: false)
        //         .postOsmitalData(27.7172, 85.3240);
        //   },
        //   child: Text('Post Data'),
        // ),

        Consumer<OsmitalData>(
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
        Positioned(
          bottom: 0,
          child: ElevatedButton(
              onPressed: () {
                newMethod(context);
              },
              child: Text("on press")),
        )
      ],
    );
  }
}

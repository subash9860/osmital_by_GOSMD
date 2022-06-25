import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:osmital/provider/bato_search.dart';

import 'package:provider/provider.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../provider/osmital_data_provider.dart';
import '../widget/user_icon.dart';
import '../provider/location_permision.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  TextEditingController search = TextEditingController();

  Position? position;
  final MapController _mapController = MapController();

  @override
  void initState() {
    Provider.of<OsmitalData>(context, listen: false).getOsmitalData();

    Provider.of<LocationProvider>(context, listen: false)
        .getCurrentLocation()
        .then((value) {
      setState(() {
        position = value;
        _mapController.move(
            LatLng(position!.latitude, position!.longitude), 16);
        Provider.of<OsmitalData>(context, listen: false)
            .postOsmitalData(value.longitude, value.latitude);
      });
    });

    // log('${Provider.of<OsmitalData>(context, listen: false).items[0].lat.toString()}');

    super.initState();
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final Osmital os =
    // Provider.of<OsmitalData>(context, listen: false).items[0];

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            Provider.of<LocationProvider>(context, listen: false)
                .getCurrentLocation()
                .then((value) {
              setState(() {
                position = value;
                _mapController.move(
                    LatLng(position!.latitude, position!.longitude), 16);
              });
            });
          },
          child: const Icon(Icons.my_location),
        ),
        body: Stack(
          children: [
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                center:
                    LatLng(position?.latitude ?? 27, position?.longitude ?? 84),
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
                      point: LatLng(
                        position?.latitude ?? 27,
                        position?.longitude ?? 84,
                      ),
                      builder: (context) => const UserIcon(),
                    ),
                    Marker(
                      point: LatLng(43, 44),
                      builder: (context) => Icon(
                        Icons.location_on,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    // TODO: add marker for hospital
                  ],
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextField(
            //     controller: search,
            //     decoration: InputDecoration(
            //       filled: true,
            //       fillColor: Color.fromARGB(148, 129, 199, 132),
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       prefixIcon: Icon(Icons.search),
            //       hintText: 'Search',
            //     ),
            //     onSubmitted: (String value) {
            //       Provider.of<BatoSearchHospital>(context, listen: false)
            //           .getBatoData(search.text);
            //       Provider.of<BatoSearchHospital>(context, listen: false)
            //           .getBatoDirection(
            //               27.717844, 85.3248188, 27.6876224, 85.33827);
            //       Dialog(
            //         child: ListView.builder(itemBuilder: (context, index) {
            //           return ListTile(
                          // title: Text(
                          // Provider.of<BatoSearchHospital>(context,
                          // listen: false)
                          // .items[index].data['name'],
                          // ),
                          // subtitle: Text(
                          // Provider.of<BatoSearchHospital>(context,
                          // listen: false)
                          // .items[index]
                          // .address,
                          // ),
                          // );
                    // }),
                  // );
                // },
              // ),
            // ),
          ],
        ));
  }
}

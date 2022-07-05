import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../provider/osmital_data_provider.dart';
import '../widget/bottom_modal_sheet.dart';
import '../widget/user_icon.dart';

class EmergencyPage extends StatefulWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  State<EmergencyPage> createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  final MapController mapController = MapController();

  bool _isLoading = true;

  late Position position;

  Future getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    log(position.toString());
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
    return SafeArea(
      child: Scaffold(
        body: (_isLoading)
            ? const Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                      center: LatLng(position.latitude, position.longitude),
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
                            point:
                                LatLng(position.latitude, position.longitude),
                            builder: (ctx) => const UserIcon(),
                          ),
                          if (Provider.of<OsmitalData>(context).itemCount != 0)
                            Marker(
                              width: 50.0,
                              height: 50.0,
                              point: LatLng(
                                double.parse(Provider.of<OsmitalData>(context)
                                    .items[0]
                                    .lat),
                                double.parse(
                                  Provider.of<OsmitalData>(context)
                                      .items[0]
                                      .lng,
                                ),
                              ),
                              builder: (ctx) => Card(
                                  color: Colors.grey[300],
                                  child: Text(
                                    Provider.of<OsmitalData>(context)
                                        .items[0]
                                        .name,
                                    style: const TextStyle(
                                        color: Colors.black54, fontSize: 10),
                                  )),
                            ),
                          if (Provider.of<OsmitalData>(context).itemCount != 0)
                            Marker(
                              width: 50.0,
                              height: 60.0,
                              point: LatLng(
                                double.parse(Provider.of<OsmitalData>(context)
                                    .items[1]
                                    .lat),
                                double.parse(
                                  Provider.of<OsmitalData>(context)
                                      .items[1]
                                      .lng,
                                ),
                              ),
                              builder: (ctx) => Card(
                                  color: Colors.grey[300],
                                  child: Text(
                                    Provider.of<OsmitalData>(context)
                                        .items[1]
                                        .name,
                                    style: const TextStyle(
                                        color: Colors.black54, fontSize: 10),
                                  )),
                            ),
                          if (Provider.of<OsmitalData>(context).itemCount != 0)
                            Marker(
                              width: 50.0,
                              height: 60.0,
                              point: LatLng(
                                double.parse(Provider.of<OsmitalData>(context)
                                    .items[2]
                                    .lat),
                                double.parse(
                                  Provider.of<OsmitalData>(context)
                                      .items[2]
                                      .lng,
                                ),
                              ),
                              builder: (ctx) => Card(
                                  color: Colors.grey[300],
                                  child: Text(
                                    Provider.of<OsmitalData>(context)
                                        .items[2]
                                        .name,
                                    style: const TextStyle(
                                        color: Colors.black54, fontSize: 10),
                                  )),
                            ),
                          if (Provider.of<OsmitalData>(context).itemCount != 0)
                            Marker(
                              width: 50.0,
                              height: 60.0,
                              point: LatLng(
                                double.parse(Provider.of<OsmitalData>(context)
                                    .items[3]
                                    .lat),
                                double.parse(
                                  Provider.of<OsmitalData>(context)
                                      .items[3]
                                      .lng,
                                ),
                              ),
                              builder: (ctx) => Card(
                                  color: Colors.grey[300],
                                  child: Text(
                                    Provider.of<OsmitalData>(context,
                                            listen: false)
                                        .items[3]
                                        .name,
                                    style: const TextStyle(
                                        color: Colors.black54, fontSize: 10),
                                  )),
                            ),
                          if (Provider.of<OsmitalData>(context).itemCount != 0)
                            Marker(
                              width: 50.0,
                              height: 60.0,
                              point: LatLng(
                                double.parse(Provider.of<OsmitalData>(context)
                                    .items[4]
                                    .lat),
                                double.parse(
                                  Provider.of<OsmitalData>(context)
                                      .items[4]
                                      .lng,
                                ),
                              ),
                              builder: (ctx) => Card(
                                  color: Colors.grey[300],
                                  child: Text(
                                    Provider.of<OsmitalData>(context)
                                        .items[4]
                                        .name,
                                    style: const TextStyle(
                                        color: Colors.black54, fontSize: 10),
                                  )),
                            ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 60, right: 60, top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (Provider.of<OsmitalData>(context).itemCount !=
                                0) {
                              newMethod(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(120, 40),
                              elevation: 5,
                              primary: Colors.redAccent),
                          child: const Text(
                            "Emergency",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (Provider.of<OsmitalData>(context).itemCount == 0)
                    const Positioned(
                      bottom: 0,
                      child: Card(
                        color: Colors.red,
                        child: Text(
                          "Hospitals around are not listed in OSM \n or unable to fetch data from server",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}

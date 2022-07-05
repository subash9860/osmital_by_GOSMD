import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import '../model/osmital_model.dart';

const url = 'https://golesuman.pythonanywhere.com/distance';

class OsmitalData with ChangeNotifier {
  final List<Osmital> _items = [];
  List<Osmital> get items => [..._items];

  int get itemCount => _items.length;

  Future<void> getOsmitalData() async {
    final response = await http.get(
      Uri.parse(
        url,
      ),
    );
    log(response.statusCode.toString());
    log(response.body);

    if (response.statusCode == 200) {
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> postOsmitalData(double lng, double lat) async {
    final response = await http.post(
      Uri.parse(
        url,
      ),
      body: jsonEncode(<String, double>{
        'lng': lng,
        'lat': lat,
      }),
    );
    print(response.statusCode.toString());
    print(response.body);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final data2 = jsonDecode(data['file']) as Map<String, dynamic>;
      final map = Map<String, dynamic>.from(data2);
      var maps = map['features'] as List<dynamic>;

      for (var element in maps) {
        var properties = element['properties'] as Map<String, dynamic>;
        var geometry = element['geometry'] as Map<String, dynamic>;
        var coordinates = geometry['coordinates'] as List<dynamic>;

        var lng = coordinates[0];
        var lat = coordinates[1];
        _items.add(Osmital(
          name: properties['name'] ?? '',
          address: properties['address'] ?? 'not added in osm',
          phone: properties['phone'] ?? 'not added in osm',
          email: properties['email'] ?? 'not added in osm',
          website: properties['website'] ?? 'not added in osm',
          description: properties['description'] ?? 'not added in osm',
          lat: lat.toString(),
          lng: lng.toString(),
          beds: properties['beds'] ?? 'not added in osm',
          capacityBeds: properties['capacityBeds'] ?? 'not added in osm',
          emergency: properties['emergency'] ?? 'not added osm',
          icu: properties['icu'] ?? 'not added in osm',
          operationTheatre:
              properties['operationTheatre'] ?? 'not added in osm',
          ventilator: properties['ventilator'] ?? 'not added in osm',
          xray: properties['xray'] ?? 'not added in osm',
          wheelchair: properties['wheelchair'] ?? 'not added in osm',
        ));
        notifyListeners();
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}

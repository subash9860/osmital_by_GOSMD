import 'dart:convert';
import 'dart:developer';
// import 'dart:ffi';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import '../model/osmital_model.dart';

// http://172.19.101.234:7778/distance
const url = 'http://172.19.101.234:7778/distance';

class OsmitalData with ChangeNotifier {
  final List<Osmital> _items = [];
  List<Osmital> get items => [..._items];

  Future<void> getOsmitalData() async {
    final response = await http.get(
      Uri.parse(
        url,
      ),
    );
    log(response.statusCode.toString());

    if (response.statusCode == 200) {
      // final data = json.decode(response.body)['file'];
      // _items = data.map<Osmital>((json) => Osmital.fromJson(json)).toList();
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
    log(response.statusCode.toString());
    log(response.body);
    if (response.statusCode == 200) {
      log(response.body);
      // final Map<String, dynamic>

      final data = json.decode(response.body);

      // log(data.toString());

      // log(data['file']);

      final data2 = jsonDecode(data['file']) as Map<String, dynamic>;
      // print(data2.runtimeType.toString());

      final map = Map<String, dynamic>.from(data2);

      // log(map.toString());

      // log(map['features']);

      var maps = map['features'] as List<dynamic>;
      // log(maps[0].toString());

      maps.forEach((element) {
        // log(element.runtimeType.toString());
        // log(element.toString());

        var properties = element['properties'] as Map<String, dynamic>;
        // log(properties.runtimeType.toString());
        // log(properties.toString());
        // log(properties['name'].toString());

        var geometry = element['geometry'] as Map<String, dynamic>;

        // log(geometry.runtimeType.toString());
        // log(geometry.toString());

        var coordinates = geometry['coordinates'] as List<dynamic>;
        // log(coordinates.runtimeType.toString());
        // log(coordinates.toString());
        var lng = coordinates[0];
        var lat = coordinates[1];
        // log('lng:${coordinates[0].toString()}');
        // log('lat:${coordinates[1].toString()}');

        _items.add(Osmital(
          name: properties['name'],
          address: properties['address'] ?? 'not added',
          phone: properties['phone'] ?? 'not added',
          email: properties['email'] ?? 'not added',
          website: properties['website'] ?? 'not added',
          description: properties['description'] ?? 'not added',
          lat: lat.toString(),
          lng: lng.toString(),
          beds: properties['beds'] ?? 'not added',
          capacityBeds: properties['capacityBeds'] ?? 'not added',
          emergency: properties['emergency'] ?? 'not added',
          icu: properties['icu'] ?? 'not added',
          operationTheatre: properties['operationTheatre'] ?? 'not added',
          ventilator: properties['ventilator'] ?? 'not added',
          xray: properties['xray'] ?? 'not added',
          wheelchair: properties['wheelchair'] ?? 'not added',
        ));

        notifyListeners();

        // log('Name: ${properties['name']}');

        // log(geometry['coordinates']);
      });

      // final map= <String, dynamic>{};

      // Map<String, dynamic>.from(data2);

      // log(data2);

      // log(data2[1]);

      // data2.forEach((key, value) {
      //   print(key);
      //   print(value);
      //   print(value.runtimeType);
      //   value.forEach((value2) {
      //     // print(key2);

      //     // print(value2.runtimeType);
      //     var fin = jsonDecode(value2) as Map<String, dynamic>;
      //     print(fin.runtimeType);
      //     print(fin);
      //   });
      // });

      // data.forEach((element) {
      //   // _items.add(Osmital.fromJson(element));
      //   log(element.toString());
      // });

      // for (var item in data.values) {
      // log(item.toString());
      // _items.add(Osmital.fromJson(item));
      // }

      // var data2 = data['features'];
      // log('Features:${data2}');

      // log(data['file']['features'][0]['properties']['name']);
      // _items = data.map<Osmital>((json) => Osmital.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }
}

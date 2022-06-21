import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import '../model/osmital_model.dart';

const url = 'https://jsonplaceholder.typicode.com/users';

class OsmitalData with ChangeNotifier {
  List<Osmital> _items = [];
  List<Osmital> get items => [..._items];

  Future<void> getOsmitalData() async {
    final response = await http.get(
      Uri.parse(
        url,
      ),
    );

    if (response.statusCode == 200) {
      log(response.body);
      final data = json.decode(response.body);
      _items = data.map<Osmital>((json) => Osmital.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
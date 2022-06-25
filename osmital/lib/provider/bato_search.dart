import 'package:baato_api/baato_api.dart';
import 'package:baato_api/models/route.dart';
import 'package:baato_api/models/search.dart';
import 'package:flutter/foundation.dart';

class BaatoHospital {
  final String name;
  final String address;

  BaatoHospital({
    required this.name,
    required this.address,
  });
}

class BatoSearchHospital with ChangeNotifier {
  late List<SearchResponse> _items;
  List<SearchResponse> get items => _items;

  String _abatoAccessToken = 'bpk.dUJEqC7bO_aimDjPkC9Rp51OUAtpNarmdOe9oNJMulWG';

  Future<void> getBatoData(String query) async {
    BaatoSearch baatoSearch = BaatoSearch.initialize(
      query: query,
      accessToken: _abatoAccessToken,
      type: 'hospital', //optional parameter
      limit: 5, //optional parameter
    );

    //perform Search
    SearchResponse response = await baatoSearch.searchQuery();

    // print(response.data);

    response.data?.forEach((element) {
      print(element.name);
      print(element.address);
    });
    notifyListeners();
  }

  Future<void> getBatoDirection(
      double lat1, double lng1, double lat2, double lng2) async {
    BaatoRoute baatoRoute = BaatoRoute.initialize(
      points: [lat1, lng1, lat2, lng2],
      accessToken: _abatoAccessToken,
      mode: 'bike',
      alternatives: false,
      instructions: false,
    );
    // RouteResponse response = await baatoRoute.getRoutes();
    // print(response);
  }
}

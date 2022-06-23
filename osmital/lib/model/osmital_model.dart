class Osmital {
  String name;
  String address;
  String phone;
  String email;
  String website;
  String description;
  String lat;
  String lng;
  String beds;
  String capacityBeds;
  String emergency;
  String icu;
  String operationTheatre;
  String ventilator;
  String xray;
  String wheelchair;

  Osmital({
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.website,
    required this.description,
    required this.lat,
    required this.lng,
    required this.beds,
    required this.capacityBeds,
    required this.emergency,
    required this.icu,
    required this.operationTheatre,
    required this.ventilator,
    required this.xray,
    required this.wheelchair,
  });

  // Osmital.fromJson(Map<String, dynamic> json) {
  //   name = json['name'];
  //   address = json['address'];
  //   phone = json['phone'];
  //   email = json['email'];
  //   website = json['website'];
  //   description = json['description'];
  //   // image = json['image'];
  //   lat = json['lat'];
  //   lng = json['lng'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['name'] = name;
  //   data['address'] = address;
  //   data['phone'] = phone;
  //   data['email'] = email;
  //   data['website'] = website;
  //   data['description'] = description;
  //   // data['image'] = this.image;
  //   data['lat'] = lat;
  //   data['lng'] = lng;
  //   return data;
  // }
}

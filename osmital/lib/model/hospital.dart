class Hospital {
  String? name;
  String? address;
  String? phone;
  String? email;
  String? website;
  String? description;
  // String? image;
  String? lat;
  String? lng;

  Hospital({
     this.name,
     this.address,
     this.phone,
     this.email,
     this.website,
     this.description,
    //  this.image,
     this.lat,
     this.lng,
  });

  Hospital.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    website = json['website'];
    description = json['description'];
    // image = json['image'];
    lat = json['lat'];
    lng = json['lng'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['address'] = address;
    data['phone'] = phone;
    data['email'] = email;
    data['website'] = website;
    data['description'] = description;
    // data['image'] = this.image;
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}

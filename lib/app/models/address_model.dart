import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'parents/model.dart';

class Address extends Model {
  late String id;
  late String description;
  late String address;
  late double latitude;
  late double longitude;
  late bool isDefault;
  late String userId;

  Address({required this.id, required this.description, required this.address, required this.latitude, required this.longitude, required this.isDefault, required this.userId});

  Address.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    description = stringFromJson(json, 'description');
    address = stringFromJson(json, 'address');
    latitude = doubleFromJson(json, 'latitude', defaultValue: 0.00);
    longitude = doubleFromJson(json, 'longitude', defaultValue: 0.00);
    isDefault = boolFromJson(json, 'default');
    userId = stringFromJson(json, 'user_id');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['default'] = this.isDefault;
    if (this.userId != null) {
      data['user_id'] = this.userId;
    }
    return data;
  }

  bool isUnknown() {
    return latitude == null || longitude == null;
  }

  String get getDescription {
    if (hasDescription()) return description;
    return address.substring(0, min(address.length, 10));
  }

  bool hasDescription() {
    if (description != null && description.isNotEmpty) return true;
    return false;
  }

  LatLng getLatLng() {
    if (this.isUnknown()) {
      return LatLng(40.4, 7);
    } else {
      return LatLng(this.latitude, this.longitude);
    }
  }
}

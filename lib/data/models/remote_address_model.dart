import '../../domain/entities/entities.dart';

import '../http/http.dart';

import './models.dart';

class RemoteAddressModel {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final RemoteGeoModel? geo;

  RemoteAddressModel(
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  );

  factory RemoteAddressModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll([
      'street',
      'suite',
      'city',
      'zipcode',
      'geo',
    ])) {
      throw HttpError.invalidData;
    }
    return RemoteAddressModel(
      json['street'] as String,
      json['suite'] as String,
      json['city'] as String,
      json['zipcode'] as String,
      json['geo'] != null ? RemoteGeoModel.fromJson(json['geo'] as Map) : null,
    );
  }

  AddressEntity toEntity() =>
      AddressEntity(street, suite, city, zipcode, geo!.toEntity());

  Json toJson() => {
        'street': street,
        'suite': suite,
        'city': city,
        'zipcode': zipcode,
        'geo': geo,
      };
}

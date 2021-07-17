import '../../domain/entities/entities.dart';

import '../http/http.dart';

import './models.dart';

class RemoteGeoModel {
  final String? lat;
  final String? lng;

  RemoteGeoModel(
    this.lat,
    this.lng,
  );

  factory RemoteGeoModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll([
      'lat',
      'lng',
    ])) {
      throw HttpError.invalidData;
    }
    return RemoteGeoModel(
      json['lat'] as String,
      json['lng'] as String,
    );
  }

  GeoEntity toEntity() => GeoEntity(lat, lng);

  Json toJson() => {
        'lat': lat,
        'lng': lng,
      };
}

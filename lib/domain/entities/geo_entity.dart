import 'package:equatable/equatable.dart';

class GeoEntity extends Equatable {
  final String? lat;
  final String? lng;

  @override
  List get props => [
        lat,
        lng,
      ];

  const GeoEntity(
    this.lat,
    this.lng,
  );
}

import 'package:equatable/equatable.dart';

import 'entities.dart';

class AddressEntity extends Equatable {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final GeoEntity? geo;
  @override
  List get props => [
        street,
        suite,
        city,
        zipcode,
        geo,
      ];

  const AddressEntity(
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  );
}

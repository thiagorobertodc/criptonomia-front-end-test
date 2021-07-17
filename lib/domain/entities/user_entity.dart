import 'package:equatable/equatable.dart';

import 'entities.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final AddressEntity? address;
  final String? phone;
  final String? website;
  final CompanyEntity? company;
  @override
  List get props =>
      [id, name, username, email, address, phone, website, company];

  const UserEntity(
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  );
}

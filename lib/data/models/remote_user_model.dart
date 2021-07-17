import '../../domain/entities/entities.dart';

import '../http/http.dart';

import './models.dart';

class RemoteUserModel {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final RemoteAddressModel? address;
  final String? phone;
  final String? website;
  final RemoteCompanyModel? company;

  RemoteUserModel(
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  );

  factory RemoteUserModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll([
      'id',
      'name',
      'username',
      'email',
      'address',
      'phone',
      'website',
      'company',
    ])) {
      throw HttpError.invalidData;
    }
    return RemoteUserModel(
      json['id'] as int,
      json['name'] as String,
      json['username'] as String,
      json['email'] as String,
      json['address'] != null
          ? RemoteAddressModel.fromJson(json['address'] as Map)
          : null,
      json['phone'] as String,
      json['website'] as String,
      json['company'] != null
          ? RemoteCompanyModel.fromJson(json['company'] as Map)
          : null,
    );
  }

  UserEntity toEntity() => UserEntity(id, name, username, email,
      address!.toEntity(), phone, website, company!.toEntity());

  Json toJson() => {
        'id': id,
        'name': name,
        'username': username,
        'email': email,
        'address': address,
        'phone': phone,
        'website': website,
        'company': company,
      };
}

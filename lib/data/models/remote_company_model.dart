import '../../domain/entities/entities.dart';

import '../http/http.dart';

import './models.dart';

class RemoteCompanyModel {
  final String? name;
  final String? catchPhrase;
  final String? bs;
  RemoteCompanyModel(
    this.name,
    this.catchPhrase,
    this.bs,
  );

  factory RemoteCompanyModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll([
      'name',
      'catchPhrase',
      'bs',
    ])) {
      throw HttpError.invalidData;
    }
    return RemoteCompanyModel(
      json['name'] as String,
      json['catchPhrase'] as String,
      json['bs'] as String,
    );
  }

  CompanyEntity toEntity() => CompanyEntity(name, catchPhrase, bs);

  Json toJson() => {
        'name': name,
        'catchPhrase': catchPhrase,
        'bs': bs,
      };
}

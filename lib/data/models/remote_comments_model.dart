import '../../domain/entities/entities.dart';

import '../http/http.dart';

import './models.dart';

class RemoteCommentsModel {
  final int? postId;
  final int? id;
  final String? name;
  final String? email;
  final String? body;

  RemoteCommentsModel(
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  );

  factory RemoteCommentsModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll([
      'postId',
      'id',
      'name',
      'email',
      'body',
    ])) {
      throw HttpError.invalidData;
    }
    return RemoteCommentsModel(
      json['postId'] as int,
      json['id'] as int,
      json['name'] as String,
      json['email'] as String,
      json['body'] as String,
    );
  }

  PostCommentEntity toEntity() =>
      PostCommentEntity(postId, id, name, email, body);

  Json toJson() => {
        'postId': postId,
        'id': id,
        'name': name,
        'email': name,
        'body': body,
      };
}

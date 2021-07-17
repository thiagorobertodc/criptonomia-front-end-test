import '../../domain/entities/entities.dart';

import '../http/http.dart';

import './models.dart';

class RemoteBlogPostModel {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  RemoteBlogPostModel(
    this.userId,
    this.id,
    this.title,
    this.body,
  );

  factory RemoteBlogPostModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll([
      'userId',
      'id',
      'title',
      'body',
    ])) {
      throw HttpError.invalidData;
    }
    return RemoteBlogPostModel(
      json['userId'] as int,
      json['id'] as int,
      json['title'] as String,
      json['body'] as String,
    );
  }

  BlogPostEntity toEntity() => BlogPostEntity(userId, id, title, body);

  Json toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };
}

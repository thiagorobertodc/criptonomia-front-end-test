import 'package:equatable/equatable.dart';

class PostCommentEntity extends Equatable {
  final int? postId;
  final int? id;

  final String? name;
  final String? email;
  final String? body;
  @override
  List get props => [postId, id, name, email, body];

  const PostCommentEntity(
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  );
}

import 'package:equatable/equatable.dart';

class BlogPostEntity extends Equatable {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;
  @override
  List get props => [userId, id, title, body];

  const BlogPostEntity(
    this.userId,
    this.id,
    this.title,
    this.body,
  );
}

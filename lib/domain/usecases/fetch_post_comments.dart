import '../entities/entities.dart';

abstract class FetchComments {
  Future<List<PostCommentEntity>?> get(String id);
}

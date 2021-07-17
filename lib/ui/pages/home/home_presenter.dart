import '../../../../domain/entities/entities.dart';

abstract class HomePresenter {
  Stream<List<BlogPostEntity>?> get postsList;
  Stream<List<PostCommentEntity>?> get commentsList;
  Future<void> getPosts();
  Future<void> getComments(String id);
}

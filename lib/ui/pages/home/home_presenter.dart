import '../../../../domain/entities/entities.dart';

abstract class HomePresenter {
  Stream<List<BlogPostEntity>?> get postsList;
  Stream<List<PostCommentEntity>?> get commentsList;
  Stream<List<UserEntity>?> get usersList;
  Future<void> getPosts();
  Future<void> getComments(String id);
  Future<void> getUsers();
  Future<void> setIndex(int newIndex);
  int? index;
  List<UserEntity>? lastUsers;
}

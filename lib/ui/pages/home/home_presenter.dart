import '../../../../domain/entities/entities.dart';

abstract class HomePresenter {
  Stream<List<BlogPostEntity>?> get postsList;
  Future<void> getPosts();
}

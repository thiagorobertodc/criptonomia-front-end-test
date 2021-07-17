import 'package:get/get.dart';

import '../../domain/usecases/usecases.dart';
import '../../domain/entities/entities.dart';
import '../../ui/pages/pages.dart';

class GetxHomePresenter extends GetxController implements HomePresenter {
  FetchBlogPosts fetchBlogPosts;

  GetxHomePresenter({
    required this.fetchBlogPosts,
  });

  final _isLoadingPost = false.obs;
  final _postList = Rx<List<BlogPostEntity>?>(null);

  Stream<List<BlogPostEntity>?> get postsList => _postList.stream;

  Stream<bool?>? get isLoadingPostStream => _isLoadingPost.stream;

  Future<void> getPosts() async {
    final posts = await fetchBlogPosts.get();
    _postList.subject.add(posts);
  }
}

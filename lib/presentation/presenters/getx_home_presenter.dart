import 'package:get/get.dart';

import '../../domain/usecases/usecases.dart';
import '../../domain/entities/entities.dart';
import '../../ui/pages/pages.dart';

class GetxHomePresenter extends GetxController implements HomePresenter {
  FetchBlogPosts fetchBlogPosts;
  FetchComments fetchComments;
  GetxHomePresenter({
    required this.fetchBlogPosts,
    required this.fetchComments,
  });

  final _isLoadingPost = false.obs;
  final _postList = Rx<List<BlogPostEntity>?>(null);
  final _commentsList = Rx<List<PostCommentEntity>?>(null);

  Stream<List<BlogPostEntity>?> get postsList => _postList.stream;
  Stream<List<PostCommentEntity>?> get commentsList => _commentsList.stream;

  Stream<bool?>? get isLoadingPostStream => _isLoadingPost.stream;

  Future<void> getPosts() async {
    final posts = await fetchBlogPosts.get();
    _postList.subject.add(posts);
  }

  Future<void> getComments(String id) async {
    final comments = await fetchComments.get(id);
    _commentsList.subject.add(comments);
  }
}

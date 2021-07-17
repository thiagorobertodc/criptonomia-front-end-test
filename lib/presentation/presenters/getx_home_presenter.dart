import 'package:get/get.dart';

import '../../domain/usecases/usecases.dart';
import '../../domain/entities/entities.dart';
import '../../ui/pages/pages.dart';

class GetxHomePresenter extends GetxController implements HomePresenter {
  FetchBlogPosts fetchBlogPosts;
  FetchComments fetchComments;
  FetchUsers fetchUsers;
  GetxHomePresenter({
    required this.fetchBlogPosts,
    required this.fetchComments,
    required this.fetchUsers,
  });

  final _postList = Rx<List<BlogPostEntity>?>(null);
  final _commentsList = Rx<List<PostCommentEntity>?>(null);
  final _usersList = Rx<List<UserEntity>?>(null);

  List<UserEntity>? lastUsers;
  Stream<List<BlogPostEntity>?> get postsList => _postList.stream;
  Stream<List<PostCommentEntity>?> get commentsList => _commentsList.stream;
  Stream<List<UserEntity>?> get usersList => _usersList.stream;
  int? index = 0;
  Future<void> getPosts() async {
    final posts = await fetchBlogPosts.get();
    _postList.subject.add(posts);
  }

  Future<void> getComments(String id) async {
    final comments = await fetchComments.get(id);
    _commentsList.subject.add(comments);
  }

  Future<void> getUsers() async {
    final users = await fetchUsers.get();
    _usersList.subject.add(users);
    lastUsers = users;
  }

  Future<void> setIndex(int newIndex) async {
    index = newIndex;
  }
}

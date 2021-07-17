import 'package:get/get.dart';

import '../../ui/pages/pages.dart';
import '../../domain/entities/entities.dart';

class GetxHomePresenter extends GetxController implements HomePresenter {
  final _isLoadingPost = false.obs;
  final _postList = Rx<List<BlogPostEntity>?>(null);

  Stream<List<BlogPostEntity>?> get postsList => _postList.stream;

  Stream<bool?>? get isLoadingPostStream => _isLoadingPost.stream;

  Future<void> getPosts() async {
    return null;
  }
}

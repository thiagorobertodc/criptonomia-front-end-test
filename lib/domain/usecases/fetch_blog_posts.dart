import '../entities/entities.dart';

abstract class FetcBlogPosts {
  Future<List<BlogPostEntity?>> get();
}

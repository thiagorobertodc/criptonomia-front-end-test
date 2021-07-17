import '../entities/entities.dart';

abstract class FetchBlogPosts {
  Future<List<BlogPostEntity>?> get();
}

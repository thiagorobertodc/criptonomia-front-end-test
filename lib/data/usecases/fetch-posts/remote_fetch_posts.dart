import '../../http/http.dart';
import '../../models/models.dart';
import '/../domain/entities/entities.dart';
import '/../domain/helpers/helpers.dart';
import '/../domain/usecases/usecases.dart';

class RemoteFetchPosts implements FetcBlogPosts {
  final HttpClient httpClient;
  final String url;

  RemoteFetchPosts({required this.httpClient, required this.url});
  Future<List<BlogPostEntity?>> get() async {
    try {
      final httpResponse = await httpClient.request(
        url: url,
        method: 'get',
      );
      final List<Map> postsList =
          (httpResponse as List).map((item) => item as Map).toList();
      List<BlogPostEntity?> lists = [];
      for (int i = 0; i < postsList.length; i++) {
        lists.add(RemoteBlogPostModel.fromJson(postsList[i]).toEntity());
      }
      return lists;
    } on HttpError catch (error) {
      throw error == HttpError.unauthorized
          ? DomainError.invalidCredentials
          : DomainError.unexpected;
    }
  }
}

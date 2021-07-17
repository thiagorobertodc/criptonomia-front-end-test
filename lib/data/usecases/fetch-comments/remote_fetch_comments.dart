import '../../http/http.dart';
import '../../models/models.dart';
import '/../domain/entities/entities.dart';
import '/../domain/helpers/helpers.dart';
import '/../domain/usecases/usecases.dart';

class RemoteFetchComments implements FetchComments {
  final HttpClient httpClient;
  final String url;

  RemoteFetchComments({required this.httpClient, required this.url});
  Future<List<PostCommentEntity>?> get() async {
    try {
      final httpResponse = await httpClient.request(
        url: url,
        method: 'get',
      );
      final List<Map> postsComments =
          (httpResponse as List).map((item) => item as Map).toList();
      List<PostCommentEntity>? lists = [];
      for (int i = 0; i < postsComments.length; i++) {
        lists.add(RemoteCommentsModel.fromJson(postsComments[i]).toEntity());
      }
      return lists;
    } on HttpError catch (error) {
      throw error == HttpError.unauthorized
          ? DomainError.invalidCredentials
          : DomainError.unexpected;
    }
  }
}

import '../../http/http.dart';
import '../../models/models.dart';
import '/../domain/entities/entities.dart';
import '/../domain/helpers/helpers.dart';
import '/../domain/usecases/usecases.dart';

class RemoteFetchUsers implements FetchUsers {
  final HttpClient httpClient;
  final String url;

  RemoteFetchUsers({required this.httpClient, required this.url});
  Future<List<UserEntity>?> get() async {
    try {
      final httpResponse = await httpClient.request(
        url: url,
        method: 'get',
      );
      final List<Map> userList =
          (httpResponse as List).map((item) => item as Map).toList();
      List<UserEntity>? lists = [];
      for (int i = 0; i < userList.length; i++) {
        lists.add(RemoteUserModel.fromJson(userList[i]).toEntity());
      }
      return lists;
    } on HttpError catch (error) {
      throw error == HttpError.unauthorized
          ? DomainError.invalidCredentials
          : DomainError.unexpected;
    }
  }
}

import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/usecases.dart';
import '../factories.dart';

FetchUsers makeFetchUsers() {
  return RemoteFetchUsers(
    httpClient: makeHttpAdapter(),
    url: makeApiUrl('users'),
  );
}

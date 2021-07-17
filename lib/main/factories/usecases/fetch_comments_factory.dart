import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/usecases.dart';
import '../factories.dart';

FetchComments makeFetchComments() {
  return RemoteFetchComments(
    httpClient: makeHttpAdapter(),
    url: makeApiUrl('posts'),
  );
}

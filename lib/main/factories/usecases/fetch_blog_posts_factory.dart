import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/usecases.dart';
import '../factories.dart';

FetchBlogPosts makeFetchBlogPosts() {
  return RemoteFetchPosts(
    httpClient: makeHttpAdapter(),
    url: makeApiUrl('posts'),
  );
}

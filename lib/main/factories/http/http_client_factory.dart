import 'package:http_interceptor/http_client_with_interceptor.dart';

import '../../../data/http/http.dart';
import '../../../infra/http/http.dart';
import 'http.dart';

HttpClient makeHttpAdapter() {
  final client = HttpClientWithInterceptor.build(interceptors: [
    HttpInterceptor(),
  ]);
  return HttpAdapter(client);
}

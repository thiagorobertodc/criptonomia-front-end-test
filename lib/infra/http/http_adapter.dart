import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

import '../../data/http/http.dart';

class HttpAdapter implements HttpClient {
  final Client client;

  HttpAdapter(this.client);

  Future<dynamic> request({
    required String url,
    required String method,
    Map? body,
    Map? headers,
  }) async {
    final bool isMultipartRequest =
        headers != null && headers.containsValue('multipart/form-data');
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json',
      });
    var response = Response('', 500);
    Future<Response>? futureResponse;
    if (isMultipartRequest && body!['photo'] != null && body['photo'] != '') {
      //MultipartRequests são maneiras mais rápidas de enviar fotos para servidores, por isso
      //fazemos algumas verificações antes de realizar a requisição
      final Map<String, String> jsonBody = Map<String, String>.from(body);
      String file = '';
      if (jsonBody.containsKey('photo')) {
        file = (jsonBody['photo'] ?? '').toString();
        jsonBody.remove('photo');
      }
      final MultipartRequest request = MultipartRequest(method, Uri.parse(url))
        ..fields.addAll(jsonBody)
        ..files.add(MultipartFile.fromBytes(
            'photo', await File(file).readAsBytes(),
            filename: 'dogPhoto', contentType: MediaType('image', 'jpeg')));
      request.headers.addAll(defaultHeaders);
      futureResponse = request.send() as Future<Response>?;
    } else {
      final jsonBody = body != null ? jsonEncode(body) : null;
      try {
        final Uri uri = Uri.parse(url);
        if (method == 'post') {
          futureResponse =
              client.post(uri, headers: defaultHeaders, body: jsonBody);
        } else if (method == 'get') {
          futureResponse = client.get(uri, headers: defaultHeaders);
        } else if (method == 'put') {
          futureResponse =
              client.put(uri, headers: defaultHeaders, body: jsonBody);
        }
        if (futureResponse != null) {
          response = await futureResponse.timeout(const Duration(seconds: 5));
        }
      } catch (error) {
        throw HttpError.serverError;
      }
    }

    return _handleResponse(response);
  }

  dynamic _handleResponse(Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body.isEmpty ? null : jsonDecode(response.body);
    } else if (response.statusCode == 204) {
      return null;
    } else if (response.statusCode == 400) {
      throw HttpError.badRequest;
    } else if (response.statusCode == 401) {
      throw HttpError.unauthorized;
    } else if (response.statusCode == 403) {
      throw HttpError.forbidden;
    } else if (response.statusCode == 404) {
      throw HttpError.notFound;
    } else {
      throw HttpError.serverError;
    }
  }
}

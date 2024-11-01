import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:fpdart/fpdart.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class NetworkManager {
  final String baseUrl;
  final Map<String, String> headers;
  final int timeOut;

  NetworkManager({
    required this.baseUrl,
    this.headers = const {},
    this.timeOut = 5,
  });

  Future<ExceptionEither<Map<String, dynamic>>> get({
    required String endPoint,
    Map<String, String>? parameters = const {},
  }) async {
    Uri uri = Uri.parse(baseUrl);
    uri = uri.replace(
      path: endPoint,
      queryParameters: parameters,
    );

    var result = await _sendRequest(
      http.get(
        uri,
        headers: headers,
      ),
    ).run();

    return result;
  }

  Future<ExceptionEither<Map<String, dynamic>>> post({
    required String endPoint,
    required Map<String, dynamic> body,
  }) async {
    Uri uri = Uri.parse(baseUrl).replace(path: endPoint);

    var result = await _sendRequest(
      http.post(
        uri,
        body: jsonEncode(body),
      ),
    ).run();

    return result;
  }

  DataTask<Map<String, dynamic>> _sendRequest(Future<http.Response> request) {
    return TaskEither.tryCatch(
      () async {
        final response = await request.timeout(Duration(seconds: timeOut));
        return _handleResponse(response: response);
      },
      (error, stackTrace) {
        if (error is SocketException) {
          return NetworkException(
            errorCode: 718,
          );
        } else if (error is TimeoutException) {
          return NetworkException(errorCode: 408);
        }

        return NetworkException(
          errorCode: 0,
          errorMessage:
              "Something went wrong - ${error.toString()}, ${stackTrace.toString()}",
        );
      },
    );
  }

  Map<String, dynamic> _handleResponse({
    required http.Response response,
  }) {
    final int statusCode = response.statusCode;

    if (statusCode >= 400) {
      throw NetworkException(
          errorCode: statusCode, errorMessage: response.body);
    }

    return json.decode(response.body);
  }
}

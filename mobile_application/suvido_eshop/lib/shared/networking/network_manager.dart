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
    this.headers = const {'Content-Type': 'application/json'},
    this.timeOut = 5,
  });

  Future<ExceptionEither<Map<String, dynamic>>> get({
    required String endPoint,
    Map<String, String>? parameters = const {},
    Map<String, String>? headers = const {},
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
        headers: {'Content-Type': 'application/json'},
      ),
    ).run();

    return result;
  }

  Future<ExceptionEither<Map<String, dynamic>>> put({
    required String endPoint,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    Uri uri = Uri.parse(baseUrl).replace(path: endPoint);

    var result = await _sendRequest(
      http.put(
        uri,
        body: jsonEncode(body),
        headers: this.headers.insert(other: headers),
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
        } else if (error is NetworkException) {
          return error;
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
        errorCode: statusCode,
        errorMessage: jsonDecode(response.body)['message'],
      );
    }

    var decoded = json.decode(response.body);

    if (decoded is Map<String, dynamic>) {
      return decoded;
    } else if (decoded is List<dynamic>) {
      return {'list': decoded};
    } else {
      throw NetworkException(
          errorCode: 0,
          errorMessage: 'Beklenmedik veri tipi, ${decoded.runtimeType}');
    }
  }
}

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:base_flutter_clean_architecture/network/api_client/error.dart';
import 'package:http/http.dart' as http;
import 'package:base_flutter_clean_architecture/network/api_client/session_provider.dart';

enum HTTPMethod {
  get,
  post,
  put,
  delete;
}

final class APIClient {
  final ISessionProvider _iSessionProvider;

  APIClient(this._iSessionProvider);

  Future<T> _request<T>(
      {required HTTPMethod method,
      required String url,
      Map<String, dynamic>? parameters,
      Encoding? encoding,
      required Future<T> Function(dynamic json) parse,
      required Function(Error error, int code) parseError}) async {
    http.Response response;
    switch (method) {
      case HTTPMethod.get:
        {
          Uri uri = Uri.parse(_iSessionProvider.getBaseUrl() + url)
              .replace(queryParameters: parameters);
          log('GET: $uri HEADERS: ${_iSessionProvider.getHeaders()}');
          response =
              await http.get(uri, headers: _iSessionProvider.getHeaders());
        }
      case HTTPMethod.post:
        {
          final body = parameters != null ? jsonEncode(parameters) : null;
          Uri uri = Uri.parse(_iSessionProvider.getBaseUrl() + url);
          response = await http.post(uri,
              headers: _iSessionProvider.getHeaders(),
              body: body,
              encoding: encoding);
        }
      case HTTPMethod.put:
        {
          final body = parameters != null ? jsonEncode(parameters) : null;
          Uri uri = Uri.parse(_iSessionProvider.getBaseUrl() + url);
          response = await http.put(uri,
              headers: _iSessionProvider.getHeaders(),
              body: body,
              encoding: encoding);
        }
      case HTTPMethod.delete:
        {
          final body = parameters != null ? jsonEncode(parameters) : null;
          Uri uri = Uri.parse(_iSessionProvider.getBaseUrl() + url);
          response = await http.delete(uri,
              headers: _iSessionProvider.getHeaders(),
              body: body,
              encoding: encoding);
        }
    }

    log('HTTP RESPONSE: ${response.statusCode} ${response.body}');
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      try {
        T result = await parse(jsonDecode(response.body));
        return result;
      } catch (e) {
        throw parseError(HTTPClientError.invalidResponse, response.statusCode);
      }
    } else if (response.statusCode >= 400 && response.statusCode <= 499) {
      throw parseError(HTTPClientError.clientError, response.statusCode);
    } else if (response.statusCode >= 500 && response.statusCode <= 599) {
      throw parseError(HTTPClientError.serverError, response.statusCode);
    } else {
      throw parseError(HTTPClientError.invalidResponse, response.statusCode);
    }
  }

  Future<T> get<T>(
      {required String url,
      Map<String, dynamic>? parameters,
      Encoding? encoding,
      required Future<T> Function(dynamic json) parse,
      required Function(Error error, int code) parseError}) async {
    return _request(
        method: HTTPMethod.get, url: url, parse: parse, parseError: parseError);
  }

 Future<T> post<T>(
      {required String url,
      Map<String, dynamic>? parameters,
      Encoding? encoding,
      required Future<T> Function(dynamic json) parse,
      required Function(Error error, int code) parseError}) async {
    return _request(
        method: HTTPMethod.post, url: url, parse: parse, parseError: parseError);
  }
 Future<T> put<T>(
      {required String url,
      Map<String, dynamic>? parameters,
      Encoding? encoding,
      required Future<T> Function(dynamic json) parse,
      required Function(Error error, int code) parseError}) async {
    return _request(
        method: HTTPMethod.put, url: url, parse: parse, parseError: parseError);
  }

  Future<T> delete<T>(
      {required String url,
      Map<String, dynamic>? parameters,
      Encoding? encoding,
      required Future<T> Function(dynamic json) parse,
      required Function(Error error, int code) parseError}) async {
    return _request(
        method: HTTPMethod.delete, url: url, parse: parse, parseError: parseError);
  }
}

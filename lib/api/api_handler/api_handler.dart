import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:to_do_app/api/api_handler/process_response.dart';

import 'exception_handlers.dart';

///
/// Sometimes the user may enter an incorrect input,
/// a network request may fail,
/// or we could have made a programmer mistake somewhere,
/// and our app will crash.
///
/// Exception handling is a way of
/// dealing with these potential errors in our
/// code so our app can gracefully recover from them.

class ApiHandler {
  /// Time out duration in seconds
  /// This will short-circuit after the given duration
  /// has elapsed by throwing a TimeoutException.
  static const int timeOutDuration = 35;

  /// GET Method
  /// A GET request is used to extract useful data
  /// from your backend to use it in your application
  ///
  /// A successful GET request would be a 200 response code and
  /// returns a response containing the information you requested.
  Future<dynamic> get(
      {required String url,
      Map<String, String>? queryParameters,
      String? bearerToken}) async {
    var uri = Uri.parse(url);
    final finalUri = uri.replace(queryParameters: queryParameters);
    log('final Uri: $finalUri');
    try {
      var response = await http.get(finalUri, headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $bearerToken"
      }).timeout(const Duration(seconds: timeOutDuration));
      return processResponse(response, finalUri.toString());
    } catch (e) {
      log('Error: $e');
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  /// POST Method
  ///
  /// We use POST to create a new resource.
  /// A POST request requires a body in which you define
  /// the data of the entity to be created.
  ///
  /// A successful POST request would be a 200 response code.
  Future<dynamic> post({
    required String url,
    Map<String, dynamic>? queryParameters,
    String? bearerToken,
    Map<String, String>? headers,
  }) async {
    var uri = Uri.parse(url);
    log('params: $queryParameters');
    log('url: $uri');
    try {
      var response = await http
          .post(
            uri,
            body: json.encode(queryParameters),
            headers: headers ??
                {
                  "Authorization": "Bearer $bearerToken",
                  "Content-Type": "application/json",
                },
          )
          .timeout(const Duration(seconds: timeOutDuration));
      log('status code: ${response.statusCode}');
      log('response: ${response.body}');
      return processResponse(response, uri.toString());
    } catch (e) {
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  /// PUT Method
  ///
  /// PUT is used to send data to a server to create/update a resource.
  ///
  /// The difference between POST and PUT is that PUT requests are idempotent.
  /// That is, calling the same PUT request multiple times
  /// will always produce the same result.
  /// In contrast, calling a POST request repeatedly have
  /// side effects of creating the same resource multiple times.
  Future<dynamic> put({
    required String url,
    Map<String, dynamic>? queryParameters,
    String? bearerToken,
    Map<String, String>? headers,
  }) async {
    var uri = Uri.parse(url);
    log('url: $uri');
    // final finalUri = uri.replace(queryParameters: queryParameters);
    try {
      var response = await http
          .put(
            uri,
            body: json.encode(queryParameters),
            headers: headers ??
                {
                  "Authorization": "Bearer $bearerToken",
                  "Content-Type": "application/json",
                },
          )
          .timeout(const Duration(seconds: timeOutDuration));
      log('status code: ${response.statusCode}');
      log('response: ${response.body}');
      log('response: $queryParameters');
      log('process response: ${processResponse(response, uri.toString())}');
      return processResponse(response, uri.toString());
    } catch (e) {
      log('expection: $e');
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  ///PATCH METHOD
  Future<dynamic> patch({
    required String url,
    Map<String, dynamic>? queryParameters,
    String? bearerToken,
    Map<String, String>? headers,
  }) async {
    var uri = Uri.parse(url);
    log('url: $uri');
    // final finalUri = uri.replace(queryParameters: queryParameters);
    try {
      var response = await http
          .patch(
        uri,
        body: json.encode(queryParameters),
        headers: headers ??
            {
              "Authorization": "Bearer $bearerToken",
              "Content-Type": "application/json",
            },
      )
          .timeout(const Duration(seconds: timeOutDuration));
      log('status code: ${response.statusCode}');
      log('response: ${response.body}');
      log('response: $queryParameters');
      log('process response: ${processResponse(response, uri.toString())}');
      return processResponse(response, uri.toString());
    } catch (e) {
      log('expection: $e');
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  /// DELETE Method
  ///
  /// The DELETE method deletes the specified resource.
  Future<dynamic> delete(
      {required String url,
      Map<String, dynamic>? queryParameters,
      String? bearerToken}) async {
    var uri = Uri.parse(url);
    // final finalUri = uri.replace(queryParameters: queryParameters);
    try {
      var response = await http
          .delete(
            uri,
            body: queryParameters,
            // headers: {
            //   "Authorization": "Bearer $bearerToken",
            //   "Content-Type": "application/json",
            // },
          )
          .timeout(const Duration(seconds: timeOutDuration));
      return processResponse(response, uri.toString());
    } catch (e) {
      throw ExceptionHandlers().getExceptionString(e);
    }
  }
}

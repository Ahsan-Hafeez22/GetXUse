import 'dart:convert';
import 'dart:io';

import 'package:getxproject/data/app_exceptions.dart';
import 'package:getxproject/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {
  /// Performs a GET request to the given [url] and returns the response.
  @override
  Future<dynamic> getApi(String url) async {
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      return _processResponse(response);
    } on SocketException {
      throw InternetException("No Internet Connection");
    } on RequestTimeoutException {
      throw RequestTimeoutException("Request Timed Out");
    } catch (e) {
      throw ServerException("Unexpected Error: $e");
    }
  }

  /// Performs a POST request to the given [url] with the provided [data].
  @override
  Future<dynamic> postApi(String url, String data) async {
    try {
      final response =
          await http.post(Uri.parse(url), body: jsonEncode(data), headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 10));
      return _processResponse(response);
    } on SocketException {
      throw InternetException("No Internet Connection");
    } on RequestTimeoutException {
      throw RequestTimeoutException("Request Timed Out");
    } catch (e) {
      throw ServerException("Unexpected Error: $e");
    }
  }

  /// Handles and processes API responses based on HTTP status codes.
  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body); // Return parsed JSON response
      case 400:
        throw BadRequestException("Bad Request");
      case 401:
      case 403:
        throw UnauthorizedException("Unauthorized Access");
      case 404:
        throw NotFoundException("Resource Not Found");
      case 500:
      default:
        throw ServerException("Server Error: ${response.statusCode}");
    }
  }
}

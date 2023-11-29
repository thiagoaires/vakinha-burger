// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

class RestClient extends GetConnect {
  final String _backendEndBaseUrl = 'http://dartweek.academiadoflutter.com.br';

  RestClient() {
    httpClient.baseUrl = _backendEndBaseUrl;
  }
}

class RestClientException implements Exception {
  final int? code;

  final String message;

  RestClientException(
    this.message, {
    this.code,
  });

  @override
  String toString() => 'RestClientException(code: $code, message: $message)';
}

import 'dart:developer';

import 'package:vakinha_burger/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burger/app/models/user_model.dart';
import 'package:vakinha_burger/app/repositories/auth/auth_repository.dart';

import '../../core/exceptions/exception.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient _client;

  AuthRepositoryImpl({required RestClient client}) : _client = client;

  @override
  Future<UserModel> register(String name, String email, String password) async {
    final result = await _client.post('/auth/register', {
      'name': name,
      'email': email,
      'password': password,
    });

    if (result.hasError) {
      var message = 'erro ao registrar usuário';
      if (result.statusCode == 400) {
        message = result.body['error'];
      }
      log(
        message,
        error: result.statusText,
        stackTrace: StackTrace.current,
      );

      throw RestClientException(message);
    }

    return UserModel.fromJson('source');
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final result = await _client.post(
      '/auth/',
      {
        'email': email,
        'password': password,
      },
    );

    if (result.hasError) {
      if (result.statusCode == 403) {
        log('User ou senha invalidos',
            error: result.statusText, stackTrace: StackTrace.current);
        throw UserNotFoundException();
      }

      log(
        'Erro ao autenticar o usuario ${result.statusCode}',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );

      throw RestClientException('Erro ao autenticar usuário');
    }

    return UserModel.fromMap(result.body);
  }
}

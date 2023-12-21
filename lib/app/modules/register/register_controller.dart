import 'dart:developer';

import 'package:get/get.dart';
import 'package:vakinha_burger/app/core/mixins/loader_mixin.dart';
import 'package:vakinha_burger/app/core/mixins/messages_mixin.dart';
import 'package:vakinha_burger/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burger/app/models/user_model.dart';
import 'package:vakinha_burger/app/repositories/auth/auth_repository.dart';

class RegisterController extends GetxController
    with LoaderMixin, MessagesMixin {
  final AuthRepository _repository;

  final loading = false.obs;
  final message = Rxn<MessageModel>();

  RegisterController({
    required repository,
  }) : _repository = repository;

  @override
  void onInit() {
    loaderListener(loading);
    messageListener(message);
    super.onInit();
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      loading.toggle();

      final UserModel userModel = await _repository.register(
        name,
        email,
        password,
      );

      loading.toggle();
      Get.back();
      message(
        MessageModel(
          "Sucesso",
          "Cadastro realizado com sucesso",
          MessageType.info,
        ),
      );
    } on RestClientException catch (e, s) {
      loading.toggle();
      log('Erro ao registrar usuario', error: e, stackTrace: s);
      message(
        MessageModel(
          "Erro",
          e.message,
          MessageType.error,
        ),
      );
    } catch (e, s) {
      loading.toggle();
      log('Erro ao registrar usuário', error: e, stackTrace: s);
      message(
        MessageModel(
          "Erro",
          "Erro ao registrar usuário",
          MessageType.error,
        ),
      );
    }
  }
}

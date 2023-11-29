import 'package:get/get.dart';
import 'package:vakinha_burger/app/core/mixins/loader_mixin.dart';
import 'package:vakinha_burger/app/core/mixins/messages_mixin.dart';
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

  void bacon() async {
    message(
      MessageModel(
        "title",
        "message",
        MessageType.error,
      ),
    );
    // loading.toggle();
    // await Future.delayed(const Duration(seconds: 5), () => loading.toggle());
  }
}

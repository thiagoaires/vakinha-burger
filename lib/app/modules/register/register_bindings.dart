import 'package:get/get.dart';
import 'package:vakinha_burger/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burger/app/repositories/auth/auth_repository.dart';
import 'package:vakinha_burger/app/repositories/auth/auth_repository_impl.dart';
import './register_controller.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(
        client: Get.find<RestClient>(),
      ),
    );
    Get.lazyPut(
      () => RegisterController(
        repository: Get.find<AuthRepository>(),
      ),
    );
  }
}

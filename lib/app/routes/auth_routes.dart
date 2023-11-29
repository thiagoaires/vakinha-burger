import 'package:get/get.dart';
import 'package:vakinha_burger/app/modules/login/login_bindings.dart';
import 'package:vakinha_burger/app/modules/login/login_page.dart';
import 'package:vakinha_burger/app/modules/register/register_bindings.dart';
import 'package:vakinha_burger/app/modules/register/register_page.dart';

class AuthRoutes {
  AuthRoutes._();

  static final routers = <GetPage>[
    GetPage(
      name: '/auth/login',
      binding: LoginBindings(),
      page: () => const LoginPage(),
    ),
    GetPage(
      name: '/auth/register',
      binding: RegisterBindings(),
      page: () => const RegisterPage(),
    )
  ];
}

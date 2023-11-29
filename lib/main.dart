import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger/app/core/bindings/application_binding.dart';
import 'package:vakinha_burger/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burger/app/routes/auth_routes.dart';
import 'package:vakinha_burger/app/routes/splash_routes.dart';

void main(List<String> args) {
  runApp(const VakinhaBurgerMainApp());
}

class VakinhaBurgerMainApp extends StatelessWidget {
  const VakinhaBurgerMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: VakinhaUi.theme,
      title: "Vakinha Burger",
      initialBinding: ApplicationBinding(),
      getPages: [
        ...SplashRoutes.routers,
        ...AuthRoutes.routers,
      ],
    );
  }
}

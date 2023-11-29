import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burger/app/core/ui/widgets/vakinha_textformfield.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff140e0e),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.width,
                child: Image.asset(
                  'assets/images/lanche.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: context.heightTransformer(reducedBy: 85),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/logo.png'),
                ),
                const SizedBox(
                  height: 60,
                ),
                VakinhaButton(
                  label: "Acessar",
                  onPressed: () {
                    Get.toNamed('/auth/login');
                  },
                  width: context.widthTransformer(reducedBy: 10),
                  height: 35,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

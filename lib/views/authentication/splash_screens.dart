import 'package:crypto_credit/views/authentication/login/login_screens.dart';
import 'package:crypto_credit/views/authentication/sign_up.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/icons/app_icons_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const LoginScreen();
      }));
    });
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: primaryColor,
      child: const Center(
          child: AppIcons(
        icons: "splash",
        size: 66,
      )),
    );
  }
}

import 'package:crypto_credit/controller/forgot_password/forgot_password_request.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/widgets/custom_button.dart';
import 'package:crypto_credit/views/widgets/custom_fields.dart';
import 'package:crypto_credit/views/widgets/page_with_nav.dart';
import 'package:crypto_credit/views/widgets/settings_container.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff030108),
      body: PageWithBackButton(
        color: const Color(0xff030108),
        body: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: Column(
              children: [
                Text(
                  "Reset Password",
                  style: appTextStyle.copyWith(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: appWhite),
                ),
                const SizedBox(
                  height: 8.9,
                ),
                Text(
                  "Type in your new password",
                  style: appTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: appWhite),
                ),
                const SizedBox(
                  height: 27,
                ),
                SettingsContainer(
                  hP: 16,
                  vP: 18.5,
                  children: [
                    PlainTextField(
                      hint: "Token",
                      label: "Paste token here",
                      stream: $resetPassword.token,
                      onchanged: $resetPassword.addToken,
                    ),
                    PlainTextField(
                      hint: "Your Password",
                      label: "Password",
                      stream: $resetPassword.password,
                      onchanged: $resetPassword.addPassword,
                    ),
                    PlainTextField(
                      hint: "Type in your password again",
                      label: "Confirm Password",
                      stream: $resetPassword.passwordConfirm,
                      onchanged: $resetPassword.addPassowrdConfirmation,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Spacer(),
                StreamBuilder<bool>(
                    stream: $resetPassword.canSend,
                    builder: (context, snapshot) {
                      return customButton(
                          enabled: snapshot.data,
                          function: () async {
                            await resetPassword(context);
                          },
                          text: "Reset Password");
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

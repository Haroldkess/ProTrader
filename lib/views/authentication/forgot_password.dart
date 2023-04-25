import 'package:crypto_credit/controller/forgot_password/forgot_password_request.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/widgets/custom_button.dart';
import 'package:crypto_credit/views/widgets/custom_fields.dart';
import 'package:crypto_credit/views/widgets/page_with_nav.dart';
import 'package:crypto_credit/views/widgets/settings_container.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      //   backgroundColor: const Color(0xff030108),
      body: PageWithBackButton(
        color: theme.scaffoldBackgroundColor,
        body: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
            child: Column(
              children: [
                Text(
                  "Forgot Password",
                  style: appTextStyle.copyWith(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: theme.textTheme.titleLarge!.color),
                ),
                const SizedBox(
                  height: 8.9,
                ),
                Text(
                  "Type your e-mail to reset your password",
                  style: appTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: theme.textTheme.titleLarge!.color),
                ),
                const SizedBox(
                  height: 27,
                ),
                SettingsContainer(
                  hP: 16,
                  vP: 18.5,
                  children: [
                    PlainTextField(
                      hint: "Your email",
                      label: "E-mail",
                      stream: $fPassword.email,
                      onchanged: $fPassword.addEmail,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Spacer(),
                StreamBuilder<bool>(
                    stream: $fPassword.canSend,
                    builder: (context, snapshot) {
                      return customButton(
                          enabled: snapshot.data,
                          function: () async {
                            await sendResetLink(context);
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

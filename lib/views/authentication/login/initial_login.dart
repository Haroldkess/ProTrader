import 'package:crypto_credit/controller/login/login_request.dart';
import 'package:crypto_credit/extensions/widget_extensions.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/authentication/forgot_password.dart';
import 'package:crypto_credit/views/authentication/sign_up.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/widgets/custom_button.dart';
import 'package:crypto_credit/views/widgets/custom_fields.dart';
import 'package:crypto_credit/views/widgets/settings_container.dart';
import 'package:flutter/material.dart';

class InitialLogin extends StatelessWidget {
  InitialLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      // backgroundColor: const Color(0xff030108),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        //   backgroundColor: const Color(0xff030108),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        child: Column(
          children: [
            Text(
              "Log in",
              style: appTextStyle.copyWith(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: theme.textTheme.titleLarge!.color),
            ),
            const SizedBox(
              height: 8.9,
            ),
            Text(
              "Fill In the form to log in",
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
              vP: 22.5,
              children: [
                PlainTextField(
                  hint: "Your email",
                  stream: $loginBloc.email,
                  onchanged: $loginBloc.addEmail,
                  label: "E-mail",
                ),
                PlainPasswordField(
                  hint: "Your Password",
                  label: "Password",
                  stream: $loginBloc.password,
                  onchanged: $loginBloc.addPassword,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Register now",
                  style: appTextStyle.copyWith(
                      color: const Color(0xff6236FF),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ).onTap(context, const SignUpScreen()),
                Text(
                  "Forgot Password?",
                  style: appTextStyle.copyWith(
                      color: const Color(0xff8F82A5),
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ).onTap(context, const ForgotPasswordScreen())
              ],
            ),
            const Spacer(),
            StreamBuilder<bool>(
                stream: $loginBloc.canLogin,
                builder: (context, snapshot) {
                  return customButton(
                      enabled: snapshot.data,
                      function: () async {
                        await loginUser(context);
                      },
                      text: "Login");
                })
          ],
        ),
      ),
    );
  }
}

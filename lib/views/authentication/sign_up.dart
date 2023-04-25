import 'package:crypto_credit/controller/registeration/register_request.dart';
import 'package:crypto_credit/extensions/widget_extensions.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/authentication/login/login_screens.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/widgets/custom_button.dart';
import 'package:crypto_credit/views/widgets/custom_fields.dart';
import 'package:crypto_credit/views/widgets/page_with_nav.dart';
import 'package:crypto_credit/views/widgets/settings_container.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      //backgroundColor: const Color(0xff030108),
      body: PageWithBackButton(
        automaticallyImplyLeading: false,
        title: "",
        color: Theme.of(context).scaffoldBackgroundColor,
        action: Text(
          "Login",
          style: appTextStyle.copyWith(
              color: primaryColor, fontSize: 15, fontWeight: FontWeight.w400),
        ).onTap(context, LoginScreen()),
        body: Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: Column(
                children: [
                  Text(
                    "Register Now",
                    style: appTextStyle.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).textTheme.titleLarge!.color),
                  ),
                  const SizedBox(
                    height: 8.9,
                  ),
                  Text(
                    "Create an account",
                    style: appTextStyle.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).textTheme.titleLarge!.color),
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  SettingsContainer(
                    hP: 16,
                    vP: 22.5,
                    children: [
                      PlainTextField(
                        hint: "Your name",
                        label: "Name",
                        stream: $registerBloc.name,
                        onchanged: $registerBloc.addName,
                      ),
                      PlainTextField(
                        stream: $registerBloc.username,
                        onchanged: $registerBloc.addUsername,
                        hint: "Your username",
                        label: "Username",
                      ),
                      PlainTextField(
                        stream: $registerBloc.email,
                        onchanged: $registerBloc.addEmail,
                        hint: "Your email",
                        label: "E-mail",
                      ),
                      PlainPasswordField(
                        hint: "Your Password",
                        stream: $registerBloc.password,
                        onchanged: $registerBloc.addPassword,
                        label: "Password",
                      ),
                      PlainPasswordField(
                        hint: "Type Password again",
                        label: "Password Again",
                        stream: $registerBloc.confirmPassword,
                        onchanged: $registerBloc.addConfirmPassword,
                      ),
                      PlainTextField(
                        hint: "coolchi212",
                        label: "Referrer Code",
                        stream: $registerBloc.referrerCode,
                        onchanged: $registerBloc.addReferrerCode,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextCheckBox(
                        stream: $registerBloc.termsAndCondition,
                        onchanged: $registerBloc.checkTermsAndCondition,
                        text: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "I agree ",
                              style: appTextStyle.copyWith(
                                  color: primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          TextSpan(
                              text: "to terms and condition",
                              style: appTextStyle.copyWith(
                                  color: appWhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400))
                        ])),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  StreamBuilder<bool>(
                      stream: $registerBloc.canRegister,
                      builder: (context, snapshot) {
                        return customButton(
                            enabled: snapshot.data,
                            function: () async {
                              await registerUser(context);
                            },
                            text: "Register");
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

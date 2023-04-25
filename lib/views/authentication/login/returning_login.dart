import 'package:crypto_credit/controller/biometrics/biometrics.dart';
import 'package:crypto_credit/controller/login/login_request.dart';
import 'package:crypto_credit/extensions/widget_extensions.dart';
import 'package:crypto_credit/models/top_traders/top_traders_models.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/authentication/forgot_password.dart';
import 'package:crypto_credit/views/authentication/login/login_screens.dart';
import 'package:crypto_credit/views/authentication/sign_up.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/widgets/custom_button.dart';
import 'package:crypto_credit/views/widgets/custom_fields.dart';
import 'package:crypto_credit/views/widgets/log.dart';
import 'package:crypto_credit/views/widgets/settings_container.dart';
import 'package:flutter/material.dart';

import '../../../local_db/login_details.dart';

class ReturningLogin extends StatefulWidget {
  const ReturningLogin({super.key});

  @override
  State<ReturningLogin> createState() => _ReturningLoginState();
}

class _ReturningLoginState extends State<ReturningLogin> {
  @override
  void initState() {
    initializeEmail();
    super.initState();
  }

  void initializeEmail() async {
    String? email = (await fetchUserDetails())["email"];
    log(email);
    $loginBloc.addEmail(email);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    initializeEmail();
    return Scaffold(
      resizeToAvoidBottomInset: true,
     // backgroundColor: const Color(0xff030108),
      appBar: AppBar(
        automaticallyImplyLeading: false,
     //   backgroundColor: const Color(0xff030108),
      ),
      body: Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
          child: Column(
            children: [
              FutureBuilder(
                  initialData: "User",
                  future: fetchUserName(),
                  builder: (context, snapshot) {
                    return Text(
                      "Welcome, ${snapshot.data}",
                      style: appTextStyle.copyWith(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: theme.textTheme.titleLarge!.color),
                    );
                  }),
              const SizedBox(
                height: 8.9,
              ),
              Text(
                "Input your password to Log in",
                style: appTextStyle.copyWith(
                    fontSize: 15, fontWeight: FontWeight.w500, color: theme.textTheme.titleLarge!.color),
              ),
              const SizedBox(
                height: 27,
              ),
              SettingsContainer(
                hP: 16,
                vP: 22.5,
                children: [
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
                        color: theme.primaryTextTheme.titleLarge!.color,
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ).onTap(context, const ForgotPasswordScreen())
                ],
              ),
              Spacer(),
              FutureBuilder<bool>(
                  future: hasBiometrics(),
                  initialData: false,
                  builder: (context, snapshot) {
                    return Visibility(
                      visible: snapshot.data!,
                      child: GestureDetector(
                        onTap: () async {
                          await authenticate(context);
                        },
                        child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: primaryColor)),
                            // ignore: unrelated_type_equality_checks
                            child: TargetPlatform.iOS != true
                                ? Icon(
                                    Icons.fingerprint,
                                    color: primaryColor,
                                    size: 48,
                                  )
                                : Icon(
                                    Icons.fingerprint_outlined,
                                    color: primaryColor,
                                    size: 48,
                                  )),
                      ),
                    );
                  }),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  clear();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  }));
                },
                child: FutureBuilder(
                    initialData: "User",
                    future: fetchUserName(),
                    builder: (context, snapshot) {
                      return Text(
                        "Not ${snapshot.data}?\n Sign Out",
                        textAlign: TextAlign.center,
                        style: appTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: theme.textTheme.titleLarge!.color),
                      );
                    }),
              ),
              Spacer(),
              StreamBuilder<bool>(
                  stream: $loginBloc.canLogin,
                  builder: (context, snapshot) {
                    return customButton(
                        enabled: snapshot.data,
                        function: () async {
                          await loginUser(context);
                        },
                        text: "Login");
                  }),
            ],
          ),
        );
      }),
    );
  }
}

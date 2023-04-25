import 'package:crypto_credit/local_db/login_details.dart';
import 'package:crypto_credit/views/authentication/login/initial_login.dart';
import 'package:crypto_credit/views/authentication/login/returning_login.dart';
import 'package:flutter/src/widgets/async.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchUserName(),
        builder: (context, snapshot) {
          return snapshot.data == "" || snapshot.data == null
              ? InitialLogin()
              : const ReturningLogin();
        });
  }
}

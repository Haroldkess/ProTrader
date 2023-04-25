import 'package:crypto_credit/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:local_auth/local_auth.dart';

import '../../local_db/login_details.dart';
import '../../views/widgets/log.dart';
import '../login/login_bloc.dart';
import '../login/login_request.dart';

Future<bool> hasBiometrics() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getBool("bc_biometrics") ?? false;
}

Future<bool> mode() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getBool("mode") ?? false;
}


setMode() async {
  
}



useBiometrics(bool? allowed) async {
  bool c = await allowBio();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setBool("bc_biometrics", c);
}

allowBio() async {
  var la = LocalAuthentication();
  var authenticated = false;

  try {
    authenticated = await la.authenticate(
        options: const AuthenticationOptions(
            biometricOnly: true, useErrorDialogs: true, stickyAuth: true),
        localizedReason: "Sign In Using Biometrics");
  } catch (e) {
    log("---$e");
    return false;
  }
  return authenticated;
}

Future<bool> isDeviceSupported() {
  var la = LocalAuthentication();
  var a = la.isDeviceSupported();
  log(a);
  return a;
}

Future<List> canChek() {
  var la = LocalAuthentication();
  var a = la.getAvailableBiometrics();
  log(a);
  return a;
}

authenticate(BuildContext context) async {
  LoginBloc loginBloc = locator.get<LoginBloc>();
  var user = await fetchUserDetails();
  var la = LocalAuthentication();
  var authenticated = false;

  try {
    authenticated = await la.authenticate(
        options: const AuthenticationOptions(
            biometricOnly: true, useErrorDialogs: true, stickyAuth: true),
        localizedReason: "Sign In Using Biometrics");
  } catch (e) {
    log(e);
  }
  if (authenticated) {
    loginBloc.addEmail(user['email']);
    loginBloc.addPassword(user["password"]);
    // ignore: use_build_context_synchronously
    loginUser(context);
  }
}

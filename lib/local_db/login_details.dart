import 'package:crypto_credit/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;

Future<Map<String, dynamic>> fetchUserDetails() async {
  sharedPreferences = await SharedPreferences.getInstance();

  try {} catch (e) {
    // ignore: invalid_use_of_visible_for_testing_member
    SharedPreferences.setMockInitialValues({});
  }
  return {
    "email": sharedPreferences!.getString("email"),
    "password": sharedPreferences!.getString("password")
  };
}

setUserDetails(String email, String password) async {
  sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences!.setString("email", email);
  sharedPreferences!.setString("password", password);
}

clear() async {
  sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences!.clear();
  sharedPreferences!.remove("email");
  sharedPreferences!.remove("password");
  sharedPreferences!.remove("saved_username");
  setUserDetails("", "");
  setUserName("");
  sharedPreferences!.remove("bc_biometrics");
}

updatePassword(String password) async {
  sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences!.setString("password", password);
}

Future<String?> fetchUserName() async {
  sharedPreferences = await SharedPreferences.getInstance();
  try {} catch (e) {
    // ignore: invalid_use_of_visible_for_testing_member
    SharedPreferences.setMockInitialValues({});
  }
  return sharedPreferences!.getString("saved_username") ?? '';
}

setUserName(String name) async {
  sharedPreferences = await SharedPreferences.getInstance();
  try {} catch (e) {
    // ignore: invalid_use_of_visible_for_testing_member
    SharedPreferences.setMockInitialValues({});
  }
  return sharedPreferences!.setString("saved_username", name);
}

switchMode(mode) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
}

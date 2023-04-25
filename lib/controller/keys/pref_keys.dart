import 'package:crypto_credit/controller/user_referal/referal_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

const String themeKey = "themeKey";
const String tokenKey = "tokenKey";
const String usernameKey = "usernameKey";
const String nameKey = "nameKey";
const String phoneKey = "phoneKey";
const String countryKey = "countryKey";
const String stateKey = "stateKey";
const String profilePhotoKey = "profilePhotoKey";
const String profileUrlKey = "profileUrlKey";
const String notificationKey = "notificationKey";
const String oldAlertKey = "oldAlertKey";
const String newAlertKey = "newAlertKey";
const String baseUrl = "http://api.bizzatrader.com";
const String accountModeKey = "accountModeKey";
const String showNotifyKey = "showNotify";
const String referIdKey = "referIdKey";

// storing pref keys for binding

const String apiPubKey = "apiPubKey";
const String apiSecretKey = "apiSecretKey";
//user id

const String userIdKey = "userIdKey";

Future<void> saveUserInfo(
  String userId,
  String? username,
  String? profileImage,
  String? name,
  String? phone,
  String? state,
  String? country,
) async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  await pref.setString(userIdKey, userId);
  await pref.setString(usernameKey, username ?? "");
  await pref.setString(profileUrlKey, profileImage ?? "");
  await pref.setString(nameKey, name ?? "");
  await pref.setString(phoneKey, phone ?? "");
  await pref.setString(countryKey, country ?? "");
  await pref.setString(stateKey, state ?? "");
}

Future<void> saveToken(
  context,
  String token,
  String id,
) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  ReferalWare action = Provider.of<ReferalWare>(context, listen: false);
  await pref.setString(tokenKey, token);
  await pref.setString(referIdKey, id);
  if (!pref.containsKey(showNotifyKey)) {
    await pref.setBool(showNotifyKey, true);
  }
 await action.addReferId(id);
}

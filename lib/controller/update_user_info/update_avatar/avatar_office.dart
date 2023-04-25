import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart';
import 'package:crypto_credit/controller/keys/pref_keys.dart';
import 'package:crypto_credit/controller/update_user_info/update_avatar/avatar_model.dart';
import 'package:crypto_credit/controller/update_user_info/update_phone/phone_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<http.StreamedResponse?> updateAvatar(AvatarModel data) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? token = pref.getString(tokenKey);
  http.StreamedResponse? response;
  final filePhotoName = basename(data.avatar!.first.path);
  List<dynamic> photo = [filePhotoName];
  var request = http.MultipartRequest(
      "POST", Uri.parse("https://api.bizzatrader.com/upload_profile"));

  Map<String, String> headers = {
    'Accept': 'application/json',
    'authorization': 'Bearer $token',
  };
  final filePhoto = await http.MultipartFile.fromPath(
      'image', data.avatar!.first.path,
      filename: filePhotoName);

  request.files.add(filePhoto);
  request.headers.addAll(headers);
  try {
    response = await request.send();
  } catch (e) {
    log("hello");
    log(e.toString());
    response = null;
  }

  return response;
}

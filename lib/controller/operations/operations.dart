import 'dart:developer';
import 'dart:io';

import 'package:crypto_credit/controller/keys/pref_keys.dart';
import 'package:crypto_credit/controller/update_user_info/update_avatar/avatar_controiller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'operation_ware.dart';

class Operations {
  static Future addPhotoFromGallery(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final ImagePicker _picker = ImagePicker();
    late XFile? _imageFile;
    OperationWare facial = Provider.of<OperationWare>(context, listen: false);
    try {
      final XFile? file = await _picker.pickImage(
          source: ImageSource.gallery,
          preferredCameraDevice: CameraDevice.rear);

      if (file != null) {
        _imageFile = file;
        log(_imageFile.path);
        pref.setString(profilePhotoKey, _imageFile.path);
        facial.addPhoto(_imageFile);
        // ignore: use_build_context_synchronously
        await UpdateAvatarController.updateAvatar(
            context, File(_imageFile.path));
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

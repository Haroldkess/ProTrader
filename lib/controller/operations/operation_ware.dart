import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class OperationWare extends ChangeNotifier {
  bool _loadStatus = false;
 // File? facial;
  File? addedPhoto;

  bool get loadStatus => _loadStatus;

  void isLoading(bool isLoad) {
    _loadStatus = isLoad;
    notifyListeners();
  }

  void addPhoto(XFile photo) {
    addedPhoto = File(photo.path);
    notifyListeners();
  }
}

import 'dart:io';
import 'package:http/http.dart';
import 'package:path/path.dart';

class AvatarModel {
  List<File>?  avatar;

  AvatarModel({
    required this.avatar,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["images"] = [
      MultipartFile.fromPath('images', avatar!.first.path,
          filename: basename(avatar!.first.path))
    ];

    return data;
  }
  // Future<Map<String, dynamic>> toJson() async => {
  //       "images": [
  //         await MultipartFile.fromPath('images', avatar!.path,
  //             filename: basename(avatar!.path))
  //       ],
  //     };
}

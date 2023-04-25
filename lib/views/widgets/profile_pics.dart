import 'dart:io';

import 'package:crypto_credit/controller/operations/operations.dart';
import 'package:crypto_credit/controller/update_user_info/update_avatar/avatar_provider.dart';
import 'package:flutter/material.dart';

import '../../controller/operations/operation_ware.dart';
import '../constants/colors/colors.dart';
import '../icons/app_icons_widget.dart';
import 'package:provider/provider.dart';

class ProfilePics extends StatelessWidget {
  const ProfilePics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    AvatarWare stream = context.watch<AvatarWare>();
    return Center(
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(80)),
              child: SizedBox(
                height: 100,
                width: 100,
                child: CircleAvatar(
                    backgroundColor: theme.colorScheme.secondary,
                    child: stream.avatarUrl.isEmpty
                        ? const AppIcons(
                            image: "avatar1",
                          )
                        : Image.network(
                            stream.avatarUrl,
                            errorBuilder: (context, error, stackTrace) {
                              return const AppIcons(
                                image: "avatar1",
                              );
                            },
                          )),
              )),
          Positioned(
            bottom: 0,
            right: 5,
            child: InkWell(
              onTap: () => Operations.addPhotoFromGallery(context),
              child: CircleAvatar(
                backgroundColor: primaryColor,
                radius: 16,
                child: Icon(
                  Icons.camera_enhance,
                  size: 14,
                  color: appWhite,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

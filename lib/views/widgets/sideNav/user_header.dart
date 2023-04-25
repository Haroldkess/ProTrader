import 'package:crypto_credit/local_db/login_details.dart';
import 'package:crypto_credit/models/user_model/user_model.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../../controller/update_user_info/update_avatar/avatar_provider.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    AvatarWare streamAvatar = context.watch<AvatarWare>();
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 10),
      decoration: BoxDecoration(color: theme.colorScheme.secondary),
      // height: kToolbarHeight * 1.5,
      child: Row(
        children: [
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(streamAvatar.avatarUrl)),
                borderRadius: BorderRadius.circular(10),
                color: primaryColor),
          ),
          const SizedBox(
            width: 16,
          ),
          StreamBuilder<User>(
              stream: $user.users,
              builder: (context, snapshot) {
                while (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                setUserName(snapshot.data!.username.toString());
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      snapshot.data!.name ?? "Sebastien Doe",
                      style: appTextStyle.copyWith(
                          color: theme.textTheme.titleLarge!.color,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      snapshot.data!.id ?? "677774",
                      style: appTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff69587F)),
                    )
                  ],
                );
              }),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.close,
              color: Color(0xff69587F),
            ),
          )
        ],
      ),
    )
        .animate(delay: 200.ms)
        .fadeIn(duration: 700.ms, delay: 100.ms)
        .shimmer(blendMode: BlendMode.srcOver, color: Colors.white12)
        .move(begin: const Offset(-16, 0), curve: Curves.easeOutQuad);
  }
}

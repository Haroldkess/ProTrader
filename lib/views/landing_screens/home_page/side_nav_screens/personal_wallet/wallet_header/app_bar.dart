import 'package:flutter/material.dart';

import '../../../../../../service_locator.dart';
import '../../../../../constants/colors/colors.dart';
import '../../../../../constants/textDecoration/text_decoration.dart';
import '../../../notification/notifications_screens.dart';

Widget appBarAction(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return NotificationsScreen();
      }));
    },
    child: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Icon(
          Icons.notifications_outlined,
          size: 28,
          color: primaryColor,
        ),
        StreamBuilder<String>(
            stream: $notificationsBloc.count,
            builder: (context, snapshot) {
              return Positioned(
                right: 2,
                top: 10,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Color(0xffFF396F),
                  child: Center(
                    child: Text(
                      snapshot.data == null ? "0" : snapshot.data.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            })
      ],
    ),
  );
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Text("Personal Wallet",
        style: appTextStyle.copyWith(
            color: theme.textTheme.titleLarge!.color,
            fontSize: 17,
            fontWeight: FontWeight.w600));
  }
}

class AppBarLeading extends StatelessWidget {
  const AppBarLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: primaryColor,
      ),
      onPressed: () => Navigator.pop(context),
    );
  }
}

import 'package:crypto_credit/controller/two_fa/two_fa_controller.dart';
import 'package:crypto_credit/controller/two_fa/two_fa_provider.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/landing_screens/settings/two_factor/two_factor_extra/reset_two_fa.dart';
import 'package:crypto_credit/views/landing_screens/settings/two_factor/two_factor_extra/verify_token_widget.dart';
import 'package:crypto_credit/views/widgets/loaders/progress_loader.dart';
import 'package:flutter/material.dart';

import '../../../constants/textDecoration/text_decoration.dart';
import '../../../widgets/custom_fields.dart';
import '../../home_page/notification/notifications_screens.dart';

class TwoFactor extends StatelessWidget {
  const TwoFactor({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.secondary,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left_sharp,
            color: primaryColor,
            size: 32,
          ),
        ),
        centerTitle: true,
        title: Text("2FA",
            style: appTextStyle.copyWith(
                color: theme.textTheme.titleLarge!.color,
                fontSize: 17,
                fontWeight: FontWeight.w600)),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NotificationsScreen();
              }));
            },
            child: Icon(
              Icons.notifications_outlined,
              size: 28,
              color: primaryColor,
            ),
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
            child: Column(
          children: const [
            ResetToken(
              hash: "Hello code",
            ),
            SizedBox(
              height: 20,
            ),
            VerifyToken()
          ],
        )),
      ),
    );
  }
}


import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/landing_screens/home_page/side_nav_screens/personal_wallet/wallet_sections/main_wallet.dart';
import 'package:crypto_credit/views/landing_screens/home_page/side_nav_screens/personal_wallet/wallet_sections/wallet_transactions.dart';
import 'package:flutter/material.dart';

import '../../../../../service_locator.dart';
import '../../../../constants/textDecoration/text_decoration.dart';
import '../../notification/notifications_screens.dart';
import 'wallet_header/app_bar.dart';

class PersonalWalletScreen extends StatelessWidget {
  const PersonalWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
            leading: const AppBarLeading(),
            centerTitle: true,
            title: const AppBarTitle(),
            actions: [
              appBarAction(context),
              const SizedBox(
                width: 16,
              ),
            ]),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: const [
            MainWallet(),
            SizedBox(
              height: 16,
            ),
            WalletTransactions()
          ],
        ));
  }
}

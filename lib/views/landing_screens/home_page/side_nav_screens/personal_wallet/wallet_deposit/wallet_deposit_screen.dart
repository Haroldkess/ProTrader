import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/landing_screens/home_page/side_nav_screens/personal_wallet/wallet_deposit/deposit_extras/transaction_hash.dart';
import 'package:crypto_credit/views/landing_screens/home_page/side_nav_screens/personal_wallet/wallet_deposit/deposit_extras/transaction_notice.dart';
import 'package:flutter/material.dart';

import '../wallet_header/app_bar.dart';

class WalletDepositScreen extends StatelessWidget {
  const WalletDepositScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.secondary,
        leading: const AppBarLeading(),
        centerTitle: true,
        title: Text("Deposit",
            style: appTextStyle.copyWith(
                color: theme.textTheme.titleLarge!.color,
                fontSize: 17,
                fontWeight: FontWeight.w600)),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("History",
                  style: appTextStyle.copyWith(
                      color: primaryColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w700)),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              TransactionHashGeneratePage(),
              SizedBox(
                height: 20,
              ),
              WalletNotice(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:crypto_credit/views/landing_screens/home_page/side_nav_screens/personal_wallet/extra/wraper.dart';
import 'package:crypto_credit/views/landing_screens/home_page/side_nav_screens/personal_wallet/wallet_sections/components/wallet_actions.dart';
import 'package:crypto_credit/views/landing_screens/home_page/side_nav_screens/personal_wallet/wallet_sections/components/wallet_balance.dart';
import 'package:crypto_credit/views/widgets/modals/send_money_modal.dart';
import 'package:crypto_credit/views/widgets/modals/withdrawal_modal.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/textDecoration/text_decoration.dart';
import '../wallet_deposit/deposit_modal.dart';

class MainWallet extends StatelessWidget {
  const MainWallet({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Wallets",
            style: appTextStyle.copyWith(
                color: theme.textTheme.titleLarge!.color,
                fontSize: 17,
                fontWeight: FontWeight.w600)),
        const SizedBox(
          height: 8,
        ),
        ViewWrapper(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const WalletBalance(),
                const SizedBox(
                  height: 25,
                ),
                const Divider(
                  thickness: .7,
                  //   color: Colors.grey[900],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WalletActions(
                      title: "Deposit",
                      icon: "add",
                      tap: () => walletDepositModal(context),
                    ),
                    WalletActions(
                      title: "Withdraw",
                      icon: "trades_1",
                      tap: () => showWithdrawalModal(context),
                    ),
                    WalletActions(
                      title: "Transfer",
                      icon: "pairwise",
                      tap: () => transferModal(context),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:crypto_credit/controller/update_user_info/update_password/password_ware.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/landing_screens/home_page/side_nav_screens/personal_wallet/wallet_deposit/wallet_deposit_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

walletDepositModal(
  BuildContext? context,
) {
  var theme = Theme.of(context!);

  return showModalBottomSheet(
      backgroundColor: theme.colorScheme.secondary,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        PasswordWare stream = context.watch<PasswordWare>();
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.89,
          // padding: EdgeInsets.only(
          //     left: 16,
          //     right: 11,
          //     bottom: MediaQuery.of(context).viewInsets.bottom,
          //     top: 10),
          //  color: theme.colorScheme.secondary,
          child:  WalletDepositScreen(),
          
       
        );
      });
}

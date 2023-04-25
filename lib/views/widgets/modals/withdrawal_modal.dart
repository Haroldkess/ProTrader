import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/widgets/custom_button.dart';
import 'package:crypto_credit/views/widgets/custom_fields.dart';
import 'package:flutter/material.dart';

showWithdrawalModal(BuildContext? context) {
  var theme = Theme.of(context!);
  showModalBottomSheet(
      backgroundColor: theme.colorScheme.secondary,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      )),
      builder: (context) => Container(
            // height: 250,/
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
            color: theme.colorScheme.secondary,
            child: ListView(
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.close)),
                    const Spacer(),
                    Text(
                      "Withdrawal",
                      textAlign: TextAlign.center,
                      style: appTextStyle.copyWith(
                          fontSize: 15,
                          color: theme.textTheme.titleLarge!.color,
                          fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  color: appWhite,
                  thickness: 0.02,
                ),
                const SizedBox(
                  height: 10,
                ),
                RoundedTextField(
                  label: "Withdrawal Amount",
                  hint: "0",
                  onchanged: (e) {
                    print(e);
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                RoundedTextField(
                  label: "USDT Address",
                  hint: "",
                  onchanged: (e) {
                    print(e);
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "Balance Available",
                      style: appTextStyle.copyWith(
                          color: theme.textTheme.titleLarge!.color,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Text(
                      "0 USDT",
                      style: appTextStyle.copyWith(
                          color: primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      "Transaction Fee",
                      style: appTextStyle.copyWith(
                          color: theme.textTheme.titleLarge!.color,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Text(
                      "2 USDT",
                      style: appTextStyle.copyWith(
                          color: theme.textTheme.titleLarge!.color,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      "Arrival quantity",
                      style: appTextStyle.copyWith(
                          color: theme.textTheme.titleLarge!.color,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Text(
                      "14900 USDT",
                      style: appTextStyle.copyWith(
                          color: primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Note: Address must be of USDT.TRC20 blockchain",
                  textAlign: TextAlign.start,
                  style: appTextStyle.copyWith(
                      color: theme.textTheme.titleLarge!.color,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 22,
                ),
                customButton(backgroundColor: primaryColor, text: "Withdraw"),
                const SizedBox(
                  height: 20,
                ),
                customButton(
                  backgroundColor: Colors.red,
                  text: "Cancel",
                  function: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 22,
                ),
              ],
            ),
          ));
}

import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/widgets/custom_button.dart';
import 'package:crypto_credit/views/widgets/custom_fields.dart';
import 'package:flutter/material.dart';

transferModal(BuildContext? context) {
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
                      "Transfer Asset",
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
                  label: "Transfer Amount",
                  hint: "0",
                  onchanged: (e) {
                    print(e);
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                RoundedTextField(
                  label: "User ID",
                  hint: "Enter userid",
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
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Operation Reminder",
                        style: appTextStyle.copyWith(
                            color: appWhite,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "If the receiving accounts fills in the external withdrawal assets, the withdrawal fee will be charged: 2USDT",
                        style: appTextStyle.copyWith(
                            color: appWhite,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                customButton(
                    backgroundColor: primaryColor, text: "Transfer Funds"),
                SizedBox(
                  height: 22,
                ),
              ],
            ),
          ));
}

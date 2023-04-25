import 'package:crypto_credit/models/user_model/user_model.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/widgets/clipboard.dart';
import 'package:crypto_credit/views/widgets/log.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';

showDepositModal(BuildContext? context) {
  var theme = Theme.of(context!);
  showModalBottomSheet(
      backgroundColor: theme.colorScheme.secondary,
      context: context,
      builder: (context) => ListView(
            children: [
              StreamBuilder<User>(
                  stream: $user.users,
                  builder: (context, snapshot) {
                    log(snapshot.data);
                    while (snapshot.data == null) {
                      return Column(
                        children: const [
                          Text(
                              "Maximum limit of generate address is 500 and you crossed this limit."),
                        ],
                      );
                    }
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 0),
                      color: theme.colorScheme.secondary,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 22,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(Icons.close)),
                              const Spacer(),
                              Text(
                                "Deposit",
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
                          Text(
                            "Chain Name: TRC20",
                            style: appTextStyle.copyWith(
                                color: theme.textTheme.titleLarge!.color,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "By scanning this QR code",
                            style: appTextStyle.copyWith(
                                color: theme.textTheme.titleLarge!.color,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          QrImage(
                            data: snapshot.data!.depositAddress ??
                                "899388399300003",
                            version: QrVersions.auto,
                            backgroundColor: appWhite,
                            size: 180.0,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(snapshot.data!.depositAddress ??
                                  "6896896987838"),
                              const SizedBox(
                                width: 12,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    copyToClipboard(context, "Address");
                                  },
                                  child: const Icon(Icons.copy)),
                            ],
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(5)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Notice:",
                                  style: appTextStyle.copyWith(
                                      color: appWhite,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "To Activate you id, you deposit exactly 150USDT to the Above address in a single Txn. First deposit should be 150USDT. After that, you deposit any amount to your asset balance",
                                  style: appTextStyle.copyWith(
                                      color: appWhite,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(5)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Note:",
                                  style: appTextStyle.copyWith(
                                      color: appWhite,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Assets are not withdrawable",
                                  style: appTextStyle.copyWith(
                                      color: appWhite,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ],
          ));
}

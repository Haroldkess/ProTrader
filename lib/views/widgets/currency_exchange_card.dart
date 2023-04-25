import 'package:crypto_credit/extensions/widget_extensions.dart';
import 'package:crypto_credit/models/top_coins/top_coins_model.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/landing_screens/home_page/coin_details.dart';
import 'package:flutter/material.dart';

class CurrencyExchangeCard extends StatelessWidget {
  const CurrencyExchangeCard({Key? key, this.topCoinsModel}) : super(key: key);

  final TopCoinsModel? topCoinsModel;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        decoration: BoxDecoration(
            color: theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(80)),
              child: SizedBox(
                  height: 48,
                  width: 48,
                  child: CircleAvatar(
                    backgroundColor: secondaryColor,
                    child: Image.network(
                      formatCoinImage(topCoinsModel!.symbol),
                      errorBuilder: (context, error, stackTrace) {
                        return const CircleAvatar(
                          radius: 48,
                        );
                      },
                      fit: BoxFit.contain,
                    ),
                  )),
            ),
            const SizedBox(
              width: 13,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(topCoinsModel!.symbol.toString(),
                    style: appTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: theme.textTheme.titleLarge!.color)),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text("Changes: ",
                        style: appTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff999999))),
                    Text(
                        "${double.parse(topCoinsModel!.percentage).toStringAsFixed(2)}%",
                        style: appTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: topCoinsModel!.percentage
                                    .toString()
                                    .contains("-")
                                ? appRedColor
                                : const Color(0xff33D039)))
                  ],
                )
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Text("Mark price",
                    style: appTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff8B8B8B))),
                const SizedBox(
                  height: 10,
                ),
                Text(double.parse(topCoinsModel!.open).toStringAsFixed(2),
                    style: appTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: theme.textTheme.titleLarge!.color)),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 1.0, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    primary: primaryColor,
                    shadowColor: primaryColor),
                onPressed: () async {
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return CoinDetailsWithSignal(
                      e: topCoinsModel,
                    );
                  }));
                },
                child: Text("View".toUpperCase(),
                    style: appTextStyle.copyWith(
                        fontSize: 10,
                        color: appWhite,
                        fontWeight: FontWeight.w700)),
              ),
            ),
            // Column(
            //   children: [

            //     ElevatedButton(
            //         style: ElevatedButton.styleFrom(
            //             shape: RoundedRectangleBorder(
            //               side: const BorderSide(
            //                   width: 1.0, color: Colors.transparent),
            //               borderRadius: BorderRadius.circular(8),
            //             ),
            //             primary: Colors.red,
            //             shadowColor: Colors.red),
            //         onPressed: () async {
            //           // fetchSinglePositions(topCoinsModel!.id.toString());
            //           // await Navigator.push(context,
            //           //     MaterialPageRoute(builder: (context) {
            //           //   return Container();
            //           //   // return TradeDetailsWithSignal(tradeData: topCoinsModel);
            //           // }));
            //         },
            //         child: Text(
            //           "Sell".toUpperCase(),
            //           style: appTextStyle.copyWith(
            //               fontSize: 10,
            //               color: appWhite,
            //               fontWeight: FontWeight.w700),
            //         ))
            //   ],
            // ),
          ],
        ));
  }
}

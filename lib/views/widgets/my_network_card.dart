import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyNetworkCard extends StatelessWidget {
  const MyNetworkCard(
      {Key? key,
      this.tradeAmount,
      this.name,
      this.date,
      this.imageUrl,
      required this.referrerId,
      required this.referralId})
      : super(key: key);

  final String? name, date, tradeAmount, imageUrl, referrerId, referralId;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
        decoration: BoxDecoration(
            color: theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(10)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                // height: 48,
                // width: 48,

                child: imageUrl!.contains(".svg")
                    ? SvgPicture.network(imageUrl!.replaceAll('\\', '/'))
                    : Image.network(imageUrl!.replaceAll('\\', '/')),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: const BoxConstraints(maxWidth: 68.27),
                    child: Text(
                      "$name",
                      softWrap: true,
                      style: appTextStyle.copyWith(
                          color: theme.textTheme.titleLarge!.color,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Container(
                      width: 70,
                      child: RichText(
                        text: TextSpan(
                            text: referrerId!,
                            style: appTextStyle.copyWith(
                                color: lightTextColor,
                                fontSize: 11,
                                fontWeight: FontWeight.w500),
                            children: [
                              TextSpan(
                                text: referralId,
                                style: appTextStyle.copyWith(
                                    color: primaryColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500),
                              )
                            ]),
                      )),
                ],
              ),
            ],
          ),

          const SizedBox(
            width: 16,
          ),
          //  const Spacer(),
          Column(
            children: [
              const Text("Date"),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: 70,
                decoration: BoxDecoration(
                    color: const Color(0xff8494A8),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "$date",
                  textAlign: TextAlign.center,
                  style: appTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: appWhite),
                ),
              )
            ],
          ),
          const SizedBox(
            width: 16,
          ),
          // const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  tradeAmount!,
                  style: appTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(
                      0xff1DCC70,
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

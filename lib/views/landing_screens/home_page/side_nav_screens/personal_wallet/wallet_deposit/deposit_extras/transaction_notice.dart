import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:flutter/material.dart';

class WalletNotice extends StatelessWidget {
  const WalletNotice({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15.8, horizontal: 8),
          decoration: BoxDecoration(
              color: const Color(0xff8595A7),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Expanded(
                child: Text(
                    "Notice\n\nTo activate your Id, you deposit exactly 150 USTD to the Above address in a single Txn. First deposit should be 150 USTD. After that, you can deposit any amount to your asset balance",
                    textAlign: TextAlign.start,
                    style: appTextStyle.copyWith(
                        color: appWhite,
                        fontSize: 13,
                        fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15.8, horizontal: 8),
          decoration: BoxDecoration(
              color: const Color(0xff8595A7),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Expanded(
                child: Text("Note\n\nAssets are NOT withdrawable!",
                    textAlign: TextAlign.start,
                    style: appTextStyle.copyWith(
                        color: appWhite,
                        fontSize: 13,
                        fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

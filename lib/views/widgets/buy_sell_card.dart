import 'package:crypto_credit/views/widgets/modals/send_money_modal.dart';
import 'package:crypto_credit/views/widgets/modals/withdrawal_modal.dart';
import 'package:flutter/material.dart';

import '../constants/colors/colors.dart';
import 'custom_button.dart';

class BuySellCard extends StatelessWidget {
  const BuySellCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
            color: secondaryColor, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Expanded(
                child: customButton(
                    function: () { 
                    },
                    backgroundColor: const Color(0xff1DCC70),
                    text: "BUY")),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: customButton(
                    function: () { 
                    },
                    backgroundColor: const Color(0xffFF396F),
                    text: "SELL")),
                      const SizedBox(
              width: 16,
            ),
            Expanded(
                child: customButton(
                    function: () { 
                    },
                    backgroundColor: const Color(0xff1DCC79),
                    text: "BOTH")),
          ],
        ),
      ),
    );
  }
}

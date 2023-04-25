import 'package:crypto_credit/controller/adjust_margin/adjust_margin_request.dart';
import 'package:crypto_credit/extensions/widget_extensions.dart';
import 'package:crypto_credit/models/positions_model/positions_model.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/widgets/custom_button.dart';
import 'package:crypto_credit/views/widgets/custom_fields.dart';
import 'package:crypto_credit/views/widgets/kDivider.dart';
import 'package:crypto_credit/views/widgets/log.dart';
import 'package:flutter/material.dart';

double? result = 0.0;
void adjustMarginDialog(BuildContext? context,
    {TradePositions? tradePositions}) {
  result = double.parse($robotSettings.robot.myCost.toString()) *
      double.parse(tradePositions!.leverage.toString());
  TextEditingController size = TextEditingController();
  var theme = Theme.of(context!);
  showGeneralDialog(
    context: context,
    barrierColor: theme.scaffoldBackgroundColor, // Background color
    barrierDismissible: true,
    barrierLabel: 'Dialog',
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) {
      return Scaffold(
        backgroundColor: theme.colorScheme.secondary,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.close)),
                    const Spacer(),
                    const Text("Add Margin"),
                    const Spacer(),
                  ],
                ),
                const KDivider(),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Position Amount"),
                    Text($robotSettings.robot.myCost.toString())
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Estimated Average Price"),
                    Text("0.00")
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Leverage"),
                    Text("${tradePositions.leverage}X")
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Amount"),
                    const SizedBox(
                      width: 20,
                    ),
                    Text("$result"),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    RoundedTextField(
                      label: "Market Price",
                      enabled: false,
                      controller: TextEditingController(
                        text: double.parse(tradePositions.endPrice!)
                            .toStringAsFixed(2),
                      ),
                    ).expanded(),
                    const SizedBox(
                      width: 20,
                    ),
                    RoundedTextField(
                      controller: size,
                      hint: tradePositions.margin == "null"
                          ? "0"
                          : tradePositions.margin,
                      onchanged: $adjustMargin.addSize,
                      stream: $adjustMargin.size,
                      label: "Margin Amount",
                    ).expanded(),
                  ],
                ),
                Spacer(),
                customButton(
                  text: "Add Margin",
                  function: () async {
                    if (size.text.isEmpty) {
                      return;
                    } else {
                      $adjustMargin.addPostionID(tradePositions.positionId);
                      await adjustMarginRequest(
                          context, tradePositions.positionId, size.text);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

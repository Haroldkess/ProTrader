import 'package:crypto_credit/controller/update_demo_balance/update_demo.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/widgets/custom_button.dart';
import 'package:crypto_credit/views/widgets/custom_fields.dart';
import 'package:flutter/material.dart';

import '../../../models/dashboard_data/dashboard_data_model.dart';

showDemoUpdateModal(BuildContext? context) {
  var theme = Theme.of(context!);
  showModalBottomSheet(
      backgroundColor: theme.colorScheme.secondary,
      context: context,
      builder: (context) => Container(
            // height: MediaQuery.of(context).size.height * .3,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
            color: theme.colorScheme.secondary,
            child: Column(
              children: [
                const SizedBox(
                  height: 11,
                ),
                Text(
                  "Demo balance",
                  textAlign: TextAlign.center,
                  style: appTextStyle.copyWith(
                      fontSize: 15,
                      color: theme.textTheme.titleLarge!.color,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  color: theme.textTheme.titleLarge!.color,
                  thickness: 0.2,
                ),
                const SizedBox(
                  height: 10,
                ),
                StreamBuilder<DashboardData>(
                    stream: $dashboardDataBloc.dashBoardData,
                    builder: (context, snapshot) {
                      while (!snapshot.hasData) {
                        return const SizedBox.shrink();
                      }
                      return RoundedTextField(
                        stream: $updateDemo.balance,
                        currency: true,
                        onchanged: $updateDemo.addNewBalance,
                        label: "",
                        number: true,
                        initialValue: snapshot.data!.exchangeBalance.toString(),
                      );
                    }),
                const SizedBox(
                  height: 24,
                ),
                customButton(
                    enabled: true,
                    function: () async {
                      await updateNewBalance(context);
                    },
                    backgroundColor: const Color(0xff1DCC70),
                    text: "Update Balance")
              ],
            ),
          ));
}

import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/widgets/kDivider.dart';
import 'package:crypto_credit/views/widgets/rsi_tab_table.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_fields.dart';

class RSITab extends StatelessWidget {
  const RSITab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        RoundedTextField(
            leading: const Icon(
          Icons.search,
          color: Color(0xff69587F),
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: RoundedSelectField(
                onchanged: (e) {
                  print(e);
                },
                items: const ["Greater", "Lesser"],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(flex: 2, child: RoundedTextField()),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              flex: 3,
              child: RoundedSelectField(
                hint: "",
                items: const ["1m", "15m", "30m", "1h", "4h", "1d"],
                onchanged: (e) {
                  print(e);
                },
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                flex: 2,
                child: CustomMidButton(
                  borderR: 10,
                  fontSize: 10,
                  color: appGreen,
                  text: "GET",
                ))
          ],
        ),
        const KDivider(
          hP: 0,
          padding: 10,
        ),
        const RSITabTable(),
        const KDivider(
          hP: 0,
          padding: 10,
        ),
      ],
    );
  }
}

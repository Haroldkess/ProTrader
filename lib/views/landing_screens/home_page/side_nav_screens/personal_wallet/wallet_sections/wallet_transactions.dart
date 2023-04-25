import 'package:crypto_credit/controller/personal_wallet/transactions/tansaction_model.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/landing_screens/home_page/side_nav_screens/personal_wallet/extra/wraper.dart';
import 'package:crypto_credit/views/widgets/empty_list.dart';
import 'package:flutter/material.dart';

import 'components/data_column.dart';
import 'components/data_list_views.dart';

List<String> head = ['Date', 'Status', 'Value', 'Coin', 'Description'];

class WalletTransactions extends StatelessWidget {
  const WalletTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return ViewWrapper(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * (tansHistory.length / 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Transactions",
                style: appTextStyle.copyWith(
                    color: theme.textTheme.titleLarge!.color,
                    fontSize: 17,
                    fontWeight: FontWeight.w600)),
            const Divider(
              thickness: .7,
              //color: Colors.grey[900],
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    DataTable(
                      dividerThickness: 0.0,
                      showCheckboxColumn: false,
                      headingRowHeight: 40,
                      // headingRowColor:
                      //     MaterialStateProperty.all(HexColor('#BDBDBD')),
                      columns: head
                          .map((e) => dataColumn(context, null, e))
                          .toList(),
                      rows: tansHistory.isNotEmpty
                          ? tansHistory
                              .map((user) =>
                                  DataRow(onSelectChanged: (value) {}, cells: [
                                    dateDataCell(context, user),
                                    statusDataCell(context, user),
                                    valueDataCell(context, user),
                                    coinDataCell(context, user),
                                    descriptionDataCell(context, user),
                                  ]))
                              .toList()
                          : [
                              const DataRow(cells: [
                                DataCell(SizedBox.shrink()),
                                DataCell(SizedBox.shrink()),
                                DataCell(SizedBox.shrink()),
                                DataCell(SizedBox.shrink()),
                                DataCell(SizedBox.shrink()),
                              ])
                            ],
                    ),
                    tansHistory.isEmpty
                        ? const Positioned(
                            left: 100,
                            child: Align(
                              alignment: Alignment.center,
                              child: EmptyList(),
                            ),
                          )
                        : const SizedBox.shrink()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

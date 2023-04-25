import 'package:crypto_credit/controller/personal_wallet/transactions/tansaction_model.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:flutter/material.dart';

DataCell dateDataCell(BuildContext context, Transaction t) {
  var theme = Theme.of(context);
  return DataCell(SizedBox(
      child: Text("2019/01/02",
          style: appTextStyle.copyWith(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w400))));
}

DataCell statusDataCell(BuildContext context, Transaction t) {
  var theme = Theme.of(context);
  return DataCell(Text("PENDING",
      style: appTextStyle.copyWith(
          color: appGreen, fontSize: 16, fontWeight: FontWeight.w400)));
}

DataCell valueDataCell(BuildContext context, Transaction t) {
  return DataCell(Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Text("19,0000",
              style: appTextStyle.copyWith(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
        ),
      ],
    ),
  ));
}

DataCell coinDataCell(BuildContext context, Transaction t) {
  var theme = Theme.of(context);
  return DataCell(Container(
    decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(15)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 5),
      child: Text("BTC-USDT",
          style: appTextStyle.copyWith(
              color: appWhite, fontSize: 13, fontWeight: FontWeight.w400)),
    ),
  ));
}

DataCell descriptionDataCell(BuildContext context, Transaction t) {
  var theme = Theme.of(context);
  return DataCell(Container(
    child: Text("Lorem ipsum dolor sit amet.",
        style: appTextStyle.copyWith(
            color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w400)),
  ));
}

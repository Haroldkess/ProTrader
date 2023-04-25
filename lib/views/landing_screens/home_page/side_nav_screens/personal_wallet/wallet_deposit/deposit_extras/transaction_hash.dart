import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import '../../../../../../constants/textDecoration/text_decoration.dart';

class TransactionHashGeneratePage extends StatelessWidget {
  const TransactionHashGeneratePage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Text("Chain Name: TRC20",
            style: appTextStyle.copyWith(
                color: theme.textTheme.titleLarge!.color,
                fontSize: 17,
                fontWeight: FontWeight.w700)),
        const SizedBox(
          height: 10,
        ),
        Text("By scanningthis QR code",
            style: appTextStyle.copyWith(
                color: Colors.grey, fontSize: 17, fontWeight: FontWeight.w400)),
        const SizedBox(
          height: 10 * 2,
        ),
        const BarCode(
          hash: "0x92E3250a785204ab82BEB168f8289233cDC8030B",
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
              color: appWhite, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Expanded(
                  child: Center(
                      child: SelectableText(
                          "0x92E3250a785204ab82BEB168f8289233cDC8030B",
                          cursorColor: primaryColor,
                          style: appTextStyle.copyWith(
                              color: appBlack,
                              fontSize: 13,
                              fontWeight: FontWeight.w400))))
            ],
          ),
        ),
      ],
    );
  }
}

class BarCode extends StatelessWidget {
  final String hash;
  const BarCode({super.key, required this.hash});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: SfBarcodeGenerator(
        value: hash,
        symbology: QRCode(),
        showValue: false,
      ),
    );
  }
}

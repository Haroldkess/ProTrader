import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:provider/provider.dart';

import '../../../../../controller/two_fa/two_fa_controller.dart';
import '../../../../../controller/two_fa/two_fa_provider.dart';
import '../../../../constants/colors/colors.dart';
import '../../../../constants/textDecoration/text_decoration.dart';
import '../../../../widgets/loaders/progress_loader.dart';

class ResetToken extends StatelessWidget {
  final String? hash;
  const ResetToken({super.key, this.hash});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    TwoFactorWare stream = context.watch<TwoFactorWare>();
    return Container(
      //  height: height * 0.7,
      decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: SfBarcodeGenerator(
              value: hash,
              symbology: QRCode(),
              showValue: false,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Scan this code with your preferred, authenticator app",
                  textAlign: TextAlign.center,
                  style: appTextStyle.copyWith(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400)),
            ],
          ),
          stream.loadStatus2
              ? Loader()
              : OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      fixedSize: Size(120, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: BorderSide(
                          color: primaryColor,
                          width: 1.0,
                          style: BorderStyle.solid)),
                  onPressed: () =>
                      TwoFactorController.enableTwoFaToken(context),
                  child: Text("Reset Token",
                      textAlign: TextAlign.center,
                      style: appTextStyle.copyWith(
                          color: primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w800)),
                )
        ],
      ),
    );
  }
}

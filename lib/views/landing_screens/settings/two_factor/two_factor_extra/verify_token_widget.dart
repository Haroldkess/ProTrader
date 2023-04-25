import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../controller/two_fa/two_fa_controller.dart';
import '../../../../../controller/two_fa/two_fa_provider.dart';
import '../../../../constants/colors/colors.dart';
import '../../../../constants/textDecoration/text_decoration.dart';
import '../../../../widgets/custom_fields.dart';
import '../../../../widgets/loaders/progress_loader.dart';

class VerifyToken extends StatefulWidget {
  const VerifyToken({super.key});

  @override
  State<VerifyToken> createState() => _VerifyTokenState();
}

class _VerifyTokenState extends State<VerifyToken> {
  TextEditingController tok = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    TwoFactorWare stream = context.watch<TwoFactorWare>();

    return Container(
      decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        child: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.8, horizontal: 8),
              decoration: BoxDecoration(
                  color: primaryColor.withOpacity(.6),
                  //   color: const Color(0xff8595A7),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                        "⑦To enable multi-factor authentication with time-based one time password (TOTP) generation, register your mobile device:",
                        textAlign: TextAlign.start,
                        style: appTextStyle.copyWith(
                            color: appWhite,
                            fontSize: 13,
                            fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                      "Install an authenticator app such as Authy or Google Authenticator",
                      textAlign: TextAlign.start,
                      style: appTextStyle.copyWith(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w700)),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                      "Scan the barcode on the left hand side, or manually enter your secret token.",
                      textAlign: TextAlign.start,
                      style: appTextStyle.copyWith(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w700)),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Verification",
                      textAlign: TextAlign.start,
                      style: appTextStyle.copyWith(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w700)),
                ),
                const Expanded(
                  child: Divider(
                    thickness: 2,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                      "Enter the verification code generated on your authenticator app.",
                      textAlign: TextAlign.start,
                      style: appTextStyle.copyWith(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w700)),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: RoundedEditFields(
                    // stream: $updateDemo.balance,
                    //  onchanged: $updateDemo.addNewBalance,

                    label: "Token",
                    fontSize: 14,
                    hint: "",
                    number: false,
                    borderColor: primaryColor,
                    controller: tok,
                    autoFocus: false,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: stream.loadStatus
                        ? const Loader()
                        : OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                fixedSize: Size(100, 0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                side: BorderSide(
                                    color: primaryColor,
                                    width: 1.0,
                                    style: BorderStyle.solid)),
                            onPressed: () =>
                                TwoFactorController.verifyTwoFaToken(
                                    context, tok.text),
                            child: Text("Verify",
                                textAlign: TextAlign.center,
                                style: appTextStyle.copyWith(
                                    color: primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800)),
                          ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:crypto_credit/controller/update_user_info/update_password/password_controller.dart';
import 'package:crypto_credit/controller/update_user_info/update_password/password_ware.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/widgets/custom_button.dart';
import 'package:crypto_credit/views/widgets/custom_fields.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../custom_alerts.dart';
import '../loaders/progress_loader.dart';

updatePasswordModal(
  BuildContext? context,
) {
  var theme = Theme.of(context!);
  TextEditingController old = TextEditingController();
  TextEditingController New = TextEditingController();
  TextEditingController confirm = TextEditingController();
  return showModalBottomSheet(
      backgroundColor: theme.colorScheme.secondary,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        PasswordWare stream = context.watch<PasswordWare>();
        return Container(
          // height: MediaQuery.of(context).size.height * .3,
          padding: EdgeInsets.only(
              left: 16,
              right: 11,
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 10),
          color: theme.colorScheme.secondary,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "Change Password",
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
              RoundedEditFields(
                // stream: $updateDemo.balance,
                //  onchanged: $updateDemo.addNewBalance,

                label: "Old Password",
                hint: "",
                number: false,
                controller: old,
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedEditFields(
                // stream: $updateDemo.balance,
                //  onchanged: $updateDemo.addNewBalance,
                label: "New Password",
                hint: "",
                number: false,
                controller: New,
                obscure: true,
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedEditFields(
                // stream: $updateDemo.balance,
                //  onchanged: $updateDemo.addNewBalance,
                label: "Confirm Password",
                hint: "",
                number: false,
                controller: confirm,
                obscure: true,
              ),
              const SizedBox(
                height: 24,
              ),
              stream.loadStatus
                  ? const Loader()
                  : InkWell(
                      splashColor: Colors.white,
                      onTap: () async {
                        if (old.text.isEmpty ||
                            New.text.isEmpty ||
                            confirm.text.isEmpty) return;
                        if (New.text.isEmpty != confirm.text.isEmpty) {
                          showToast(context, "Password does not match",
                              isError: true);
                          return;
                        }

                        await UpdatePasswordController.updatePassword(
                            context, old.text, New.text, confirm.text);
                      },
                      child: modalButton(
                          enabled: true,
                          function: () async {},
                          backgroundColor: primaryColor,
                          text: "Save Changes"),
                    ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        );
      });
}

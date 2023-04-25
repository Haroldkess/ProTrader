import 'package:crypto_credit/controller/update_user_info/update_phone/phone_controller.dart';
import 'package:crypto_credit/controller/update_user_info/update_phone/phone_provider.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/widgets/custom_button.dart';
import 'package:crypto_credit/views/widgets/custom_fields.dart';
import 'package:crypto_credit/views/widgets/loaders/progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

updatePhoneModal(BuildContext? context, String currentPhone) {
  TextEditingController phone = TextEditingController(text: currentPhone);

  var theme = Theme.of(context!);
  return showModalBottomSheet(
      backgroundColor: theme.colorScheme.secondary,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        PhoneWare stream = context.watch<PhoneWare>();

        return Container(
          // height: MediaQuery.of(context).size.height * .3,
          padding: EdgeInsets.only(
              right: 16,
              left: 11,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          color: theme.colorScheme.secondary,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 11,
              ),
              Text(
                "Update Phone",
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
                label: "Phone",
                hint: "",
                number: true,
                controller: phone,
              ),
              const SizedBox(
                height: 24,
              ),
              stream.loadStatus
                  ? const Loader()
                  : InkWell(
                      splashColor: Colors.white,
                      onTap: () async {
                        if (phone.text.isEmpty) return;
                        await UpdatePhoneController.updatePhone(
                            context, phone.text);
                      },
                      child: modalButton(
                          enabled: true,
                          function: () async {},
                          backgroundColor: primaryColor,
                          text: "Save Changes"),
                    ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        );
      });
}

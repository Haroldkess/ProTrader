import 'package:crypto_credit/controller/dashboard_data/dashboard_data_request.dart';
import 'package:crypto_credit/controller/positions/positions_requests.dart';
import 'package:crypto_credit/controller/update_demo_balance/update_demo.dart';
import 'package:crypto_credit/controller/update_user_info/update_username/username_controller.dart';
import 'package:crypto_credit/controller/update_user_info/update_username/username_provider.dart';
import 'package:crypto_credit/models/top_traders/top_traders_models.dart';
import 'package:crypto_credit/models/user_model/user_model.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/widgets/custom_button.dart';
import 'package:crypto_credit/views/widgets/custom_fields.dart';
import 'package:crypto_credit/views/widgets/log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/dashboard_data/dashboard_data_model.dart';
import '../loaders/progress_loader.dart';

updateUsernameModal(BuildContext? context, String currentUserName, String currrentName) {
  var theme = Theme.of(context!);
  TextEditingController userName = TextEditingController(text: currentUserName);
  TextEditingController name = TextEditingController(text: currrentName);
  return showModalBottomSheet(
      backgroundColor: theme.colorScheme.secondary,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        UsernameWare stream = context.watch<UsernameWare>();
        return Container(
          // height: MediaQuery.of(context).size.height * .3,
          padding: EdgeInsets.only(
              left: 16,
              right: 11,
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 12),
          color: theme.colorScheme.secondary,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 11,
              ),
              Text(
                "Update Username",
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

                label: "Name",
                hint: "",
                number: false,
                controller: name,
              ),
              const SizedBox(
                height: 15,
              ),
              RoundedEditFields(
                // stream: $updateDemo.balance,
                //  onchanged: $updateDemo.addNewBalance,
                label: "Username",
                hint: "",
                number: false,
                controller: userName,
              ),
              const SizedBox(
                height: 24,
              ),
              stream.loadStatus
                  ? const Loader()
                  : InkWell(
                      splashColor: Colors.white,
                      onTap: () async {
                        if (userName.text.isEmpty) return;
                        await UpdateUsernameController.updateUsername(
                            context, userName.text);
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

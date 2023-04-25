import 'package:crypto_credit/controller/dashboard_data/dashboard_data_request.dart';
import 'package:crypto_credit/controller/positions/positions_requests.dart';
import 'package:crypto_credit/controller/update_demo_balance/update_demo.dart';
import 'package:crypto_credit/controller/update_user_info/update_address/address_controller.dart';
import 'package:crypto_credit/controller/update_user_info/update_address/address_provider.dart';
import 'package:crypto_credit/models/top_traders/top_traders_models.dart';
import 'package:crypto_credit/models/user_model/user_model.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/widgets/custom_button.dart';
import 'package:crypto_credit/views/widgets/custom_fields.dart';
import 'package:crypto_credit/views/widgets/log.dart';
import 'package:country_state_picker/country_state_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/dashboard_data/dashboard_data_model.dart';
import '../loaders/progress_loader.dart';

class updateAddressModal extends StatefulWidget {
  const updateAddressModal({super.key});

  @override
  State<updateAddressModal> createState() => _updateAddressModalState();
}

class _updateAddressModalState extends State<updateAddressModal> {


  String? state;
  String? country;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    AddressWare action = Provider.of<AddressWare>(context, listen: false);
    AddressWare stream = context.watch<AddressWare>();

    return Container(
      //height: MediaQuery.of(context).size.height * .5,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
      color: theme.colorScheme.secondary,
      child: Column(
        children: [
          const SizedBox(
            height: 11,
          ),
          Text(
            "Update Address",
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
          CountryStatePicker(
            onCountryChanged: (ct) => setState(() {
              country = ct;
              state = null;
            }),
            onStateChanged: (st) => setState(() {
              state = st;
            }),
          ),
       
          const SizedBox(
            height: 24,
          ),
          stream.loadStatus
              ? const Loader()
              : InkWell(
                  splashColor: Colors.white,
                  onTap: () async {
                    //  print(action.country);
                    if (country == null || state == null) return;
                    if (country!.isEmpty || state!.isEmpty) return;

                    await UpdateAdressController.updateAdress(
                        context, country!, state!);
                  },
                  child: modalButton(
                      enabled: true,
                      function: () async {},
                      backgroundColor: primaryColor,
                      text: "Save Changes"),
                )
        ],
      ),
    );
  }
}

updateAdressModals(BuildContext? context) {
  var theme = Theme.of(context!);
  showModalBottomSheet(
      backgroundColor: theme.colorScheme.secondary,
      context: context,
      builder: (context) => const updateAddressModal());
}

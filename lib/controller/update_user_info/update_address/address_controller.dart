import 'dart:developer';
import 'package:crypto_credit/controller/update_user_info/update_address/address_model.dart';
import 'package:crypto_credit/controller/update_user_info/update_address/address_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../views/widgets/custom_alerts.dart';

// class function to update adress from profile

class UpdateAdressController {
  static Future<void> updateAdress(
      BuildContext context, String country, String state) async {
    AddressWare ware = Provider.of<AddressWare>(context, listen: false);
    AddressModel data = AddressModel(country: country, state: state);

    ware.isLoading(true);

    bool isDone = await ware
        .updateAdressFromApi(
            data) //triggers the provider that in turn triggers the backoffice (endpoint)
        .whenComplete(() => log("everything from api and provider is done"));

    if (isDone) {
      // ware.addCountry(data.country!);
      // ware.addState(data.state!);
      ware.saveAddress(data.country!, data.state!);

      ware.isLoading(false);

      // ignore: use_build_context_synchronously
      showToast(context, ware.message, isError: false);
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } else {
      ware.isLoading(false);

      // ignore: use_build_context_synchronously
      showToast(context, ware.message, isError: true);
    }
  }
}

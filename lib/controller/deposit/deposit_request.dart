// import 'package:crypto_credit/controller/network_logic/apis.dart';
// import 'package:crypto_credit/controller/network_logic/network_calls.dart';
// import 'package:crypto_credit/models/deposit_address/deposit_address_model.dart';
// import 'package:crypto_credit/service_locator.dart';
// import 'package:crypto_credit/views/widgets/log.dart';

// getDepositAddress() async {
//   DepositAddress depositAddress;
//   var url = NetworkConstants.getNewAddress;

//   var response = await post(url: url, token: $user.accessToken, body: {});
//   if (response['status_code'] == 200) {
//     log(response);
//     depositAddress = DepositAddress.fromJson(response['data']['data']['data']);
//     $depositAddress.addDepositAddress(depositAddress);
//   }
// }

import 'package:crypto_credit/controller/network_logic/apis.dart';
import 'package:crypto_credit/controller/network_logic/network_calls.dart';
import 'package:crypto_credit/models/earning_model/earnings_model.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/widgets/log.dart'; 

fetchEarnings() async {
  var url = NetworkConstants.earnings;
  var response = await post(url: url, token: $user.accessToken, body: {});


  if (response['status_code'] == 200) {
    List<EarningsPositions> earningsPositions =
        response['data']['data']['positions'].map<EarningsPositions>((e) {
      return EarningsPositions.fromJson(e);
    }).toList();
    Earnings earnings;
    earnings = Earnings.fromJson(response['data']['data']['stats']);
    $earnings.addEarningStats(earnings);
    $earnings.addEarningPositions(earningsPositions);
  }
}


// fetchEarningsList() async {
//     var url = NetworkConstants.earnings;
//   var response = await post(url: url, token: $user.accessToken, body: {});

  
// }

import 'package:crypto_credit/controller/network_logic/apis.dart';
import 'package:crypto_credit/controller/network_logic/network_calls.dart';
import 'package:crypto_credit/models/top_coins/top_coins_model.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/widgets/log.dart';

getAllTopCoins() async {
  var url = NetworkConstants.topCoins;
  var response = await post(url: url, token: $user.accessToken, body: {});
  List<TopCoinsModel> topCoins;

  topCoins = response['data']['data'].map<TopCoinsModel>((e) {
    return TopCoinsModel.fromJson(e);
  }).toList();

  topCoins.sort((a, b) => a.symbol.compareTo(b.symbol));
  $topCoins.addTopCoins(topCoins);
}

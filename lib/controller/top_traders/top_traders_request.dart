import 'package:crypto_credit/controller/network_logic/apis.dart';
import 'package:crypto_credit/controller/network_logic/network_calls.dart';
import 'package:crypto_credit/models/top_traders/top_traders_models.dart';
import 'package:crypto_credit/service_locator.dart';

getAllTopTraders() async {
  var url = NetworkConstants.topTraders;
  var response = await post(url: url, token: $user.accessToken, body: {});

  print(response);
  List<TopTradersModel> topTraders;
  topTraders = response['data']['data'].map<TopTradersModel>((e) {
    return TopTradersModel.fromJson(e);
  }).toList();
  $topTraders.addTopTraders(topTraders);
}

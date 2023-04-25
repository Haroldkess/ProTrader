import 'package:crypto_credit/controller/network_logic/apis.dart';
import 'package:crypto_credit/controller/network_logic/network_calls.dart';
import 'package:crypto_credit/models/top_trades/top_trades_model.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/widgets/log.dart';

getAllTopTrades(String? interval) async {
  var url = NetworkConstants.topTrades;
  var response = await post(
      url: url, token: $user.accessToken, body: {"date_interval": "$interval"});
  List<TopTradesModel> topTrades;
  TopTradeStats tradeStats;
  topTrades = response['data']['data']['positions'].map<TopTradesModel>((e) {
    return TopTradesModel.fromJson(e);
  }).toList();

  tradeStats = TopTradeStats.fromJson(response['data']['data']['stats']);
  $topTrades.addTopTrades(topTrades);
  $topTrades.addTopTradesStats(tradeStats);
}

Future<List<TopTradesModel>> getAllTopTradesList(String? interval) async {
  var url = NetworkConstants.topTrades;
  var response = await post(
      url: url,
      token: $user.accessToken,
      body: {"date_interval": "$interval".toLowerCase()});
  List<TopTradesModel> topTrades;
  TopTradeStats topTradeStats;
  topTrades = response['data']['data']['positions'].map<TopTradesModel>((e) {
    return TopTradesModel.fromJson(e);
  }).toList();
  log(response);
  return topTrades;
}

Future<TopTradeStats> getAllTopTradesStats(String? interval) async {
  var url = NetworkConstants.topTrades;
  var response = await post(
      url: url,
      token: $user.accessToken,
      body: {"date_interval": "$interval".toLowerCase()});
  TopTradeStats topTradesStats;
  topTradesStats =TopTradeStats.fromJson( response['data']['data']['stats']);

  log(response);
  return topTradesStats;
}

List<TopTradesModel> mTrades = [];

List<TopTradesModel> get trades {
  return [...mTrades];
}

List<TopTradesModel> searchTrades(String? e) {
  if (e == null || e.isEmpty) {
    return mTrades;
  } else {
    return mTrades.where((element) {
      return element.symbol.toString().contains(e.toLowerCase());
    }).toList();
  }
}

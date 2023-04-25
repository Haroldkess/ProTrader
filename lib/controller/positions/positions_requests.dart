import 'package:crypto_credit/controller/network_logic/apis.dart';
import 'package:crypto_credit/controller/network_logic/network_calls.dart';
import 'package:crypto_credit/models/positions_model/positions_model.dart';
import 'package:crypto_credit/models/positions_model/single_positions_model.dart';
import 'package:crypto_credit/models/socket/socket_ticker_model.dart';
import 'package:crypto_credit/views/widgets/log.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:crypto_credit/service_locator.dart';

establishConnection(String? symbol) {
  var url = NetworkConstants.webSocket(symbol!.toLowerCase());
  final channel = WebSocketChannel.connect(
    Uri.parse(url),
  );
  log(url);
  log(channel);
  return channel;
}

fetchPositions({String? mode}) async {
  var url = NetworkConstants.getPositions;
  var response =
      await post(url: url, token: $user.accessToken, body: {"mode": "$mode"});

  List<TradePositions> tradePositions;
  tradePositions = response['data']['data'].map<TradePositions>((e) {
    return TradePositions.fromJson(e);
  }).toList();
  $positions.addTradePosition(tradePositions);
  
  int tradeCount =
      tradePositions.where((element) => element.status != 'CLOSED').length;
  $positions.addTradesCount(tradeCount.toString());
  log(response);
}

fetchSinglePositions(String? id) async {
  var url = NetworkConstants.getSinglePositions(id!);
  var response = await post(url: url, token: $user.accessToken, body: {});
  SinglePostionsModel? singlePostionsModel;
  singlePostionsModel = SinglePostionsModel.fromJson(response['data']['data']);
  $positions.addSingleTradePosition(singlePostionsModel);
}

Future<List<SinglePostionsModel>> fetchSymbolicPositions(String? symbol) async {
  var url = NetworkConstants.getPositions;
  var response = await post(
      url: url,
      token: $user.accessToken,
      body: {"status": "CLOSED", "symbol": "$symbol", "mode": ""});
  List<SinglePostionsModel> singlePostionsModelList;
  singlePostionsModelList =
      response['data']['data'].map<SinglePostionsModel>((e) {
    return SinglePostionsModel.fromJson(e);
  }).toList();
  return singlePostionsModelList;
}

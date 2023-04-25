import 'package:crypto_credit/controller/network_logic/apis.dart';
import 'package:crypto_credit/controller/network_logic/network_calls.dart';
import 'package:crypto_credit/models/single_market_ticker/single_ticker_model.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:flutter/material.dart';

getSingleSticker(BuildContext? context, String? symbol) async {
  var url = NetworkConstants.getSingleTicker(symbol);
  var response =
      await get(url: url, context: context, token: $user.accessToken);
  SingleMarketTickerModel singleMarketTickerModel;
  singleMarketTickerModel =
      SingleMarketTickerModel.fromJson(response['data']['data']);

  $singleSticker.addSingleSticker(singleMarketTickerModel);
}

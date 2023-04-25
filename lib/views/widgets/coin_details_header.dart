import 'dart:async';
import 'package:crypto_credit/models/positions_model/positions_model.dart';
import 'package:crypto_credit/models/top_coins/top_coins_model.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_market/Crypto_Market/Model/coin_model.dart';
import 'package:crypto_market/Crypto_Market/Screens/coin_graph.dart'; import 'package:flutter/material.dart';
import 'package:crypto_credit/extensions/widget_extensions.dart';
import '../constants/colors/colors.dart';

class CoinDetailsHeader extends StatelessWidget {
  const CoinDetailsHeader({Key? key, this.e}) : super(key: key);
  final TopCoinsModel? e;

  @override
  Widget build(BuildContext context) {
      var theme = Theme.of(context);
    return Stack(children: [
      Container(
        height: kToolbarHeight * 4.5,
        color: primaryColor,
      ),
      Positioned.fill(
          top: kToolbarHeight * .6,
          left: MediaQuery.of(context).size.width / 5,
          right: MediaQuery.of(context).size.width / 5,
          child: Align(
              alignment: Alignment.topCenter,
              child: CoinPrice(
                e: e,
              ))),
      Padding(
        padding: const EdgeInsets.only(
            top: kToolbarHeight * 2.7, left: 16, right: 16),
        child: Container(
          height: MediaQuery.of(context).size.height * .4,
          color: secondaryColor,
          child: coinGraph(e),
          // child: WebView(
          //   initialUrl:
          //       "https://app.bizzatrader.com/app/vue_trade_component/${widget.tradeData!.symbol}",
          //   javascriptMode: JavascriptMode.unrestricted,
          //   onWebViewCreated: (WebViewController webViewController) {
          //     print(webViewController.runJavascriptReturningResult("url"));
          //     _controller.complete(webViewController);
          //   },
          //   javascriptChannels: const <JavascriptChannel>{

          //   },
          //   navigationDelegate: (NavigationRequest request) {
          //     print(request.isForMainFrame);
          //     return NavigationDecision.navigate;
          //   },
          //   onPageFinished: (String url) async {
          //     print(url);
          //     setState(() {
          //       _isPageLoading = false;
          //     });
          //   },
          //   onPageStarted: (String url) {},
          //   gestureNavigationEnabled: true,
          //   debuggingEnabled: true,
          // ),

//            WebviewScaffold(
//             javascriptChannels: jsChannels,
//   url: 'https://pub.dev',
//   withZoom: true,
//   withLocalStorage: true,
//   hidden: true,
//   initialChild: Container(
//     child: const Center(
//       child: Text('Loading...'),
//     ),
//   ),
// )
        ),
      ),
    ]);
  }

  Widget coinGraph(TopCoinsModel? tradeData) {
    return CoinGraph(
      coinData: Coin(
          coinID: tradeData!.symbol,
          coinImage: 'https://',
          coinName: tradeData.symbol!,
          coinShortName: tradeData.symbol!,
          coinPrice: tradeData.close!,
          coinLastPrice: tradeData.change!,
          coinPercentage: tradeData.percentage!,
          coinSymbol: tradeData.symbol!,
          coinPairWith: 'USDT',
          coinHighDay: '567',
          coinLowDay: '12',
          coinDecimalPair: "3",
          coinDecimalCurrency: "4",
          coinListed: false),
      listedCoinGraphUrl:
          'https://server.justbit.co.in/orders/getohlc?symbol=${tradeData.symbol}&interval=1D',
      inrRate: 77.0,
    );
  }
}

class CoinPrice extends StatelessWidget {
  const CoinPrice({super.key, this.e});
  final TopCoinsModel? e;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: Column(
        children: [
          Text(
          "\$${double.parse(e!.open).toStringAsFixed(2)}",
            style: appTextStyle.copyWith(
                fontSize: 31, fontWeight: FontWeight.w600, color: appWhite),
          ),
          const SizedBox(
            height: 11.4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.arrow_drop_up,
                color: Color(0xff1DCC70),
              ),
              const SizedBox(
                width: 1,
              ),
              Text(
                  "\$${double.parse(e!.open).toStringAsFixed(2)}",
                style: appTextStyle.copyWith(
                    fontSize: 15, fontWeight: FontWeight.w500, color: appWhite),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "(${e!.change})",
                style: appTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: appWhite.withOpacity(.4)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

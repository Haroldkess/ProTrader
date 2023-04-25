import 'package:crypto_market/Crypto_Market/Model/coin_model.dart';
import 'package:crypto_market/crypto_market.dart';
import 'package:flutter/material.dart';

class BinanceTest extends StatefulWidget {
  const BinanceTest({Key? key}) : super(key: key);

  @override
  State<BinanceTest> createState() => _BinanceTestState();
}

class _BinanceTestState extends State<BinanceTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Market'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height *.4,
        padding: const EdgeInsets.only(top: 6),
        child: coinGraph(),
      ),
    );
  }

  Widget allCoin() {
    return AllCoin(
      coinsList: coinsList,
      currencyList: currencyList,
      tickerList: tickerList,
      wishlistCoinsList: wishlistCoinsList,
      showWishlistAtFirst: false,
      currencyTabSelectedItemColor: Colors.red,
      currencyTabBackgroundColor: Colors.transparent,
      currencyTabHeight: 100,
      showHeading: true,
      inrRate: 77.0,
      //
      // onWishlistError: Center(child: Text('Wishlist not found!!', style: TextStyle(color: Colors.grey.shade600, fontSize: 20),),),
      onCoinTap: (ctx, coin) {
        ///  ------  ///
      },
    );
  }

  Widget coinGraph() {
    return CoinGraph(
      coinData: coinsList.elementAt(0),
      listedCoinGraphUrl:
          'https://server.justbit.co.in/orders/getohlc?symbol=CVXUSDT&interval=1h',
      inrRate: 77.0,
    );
  }

  orderBook() {
    return CoinOrderBook(
      coinData: coinsList.elementAt(0),
      // listedCoinOrderBookUrl: 'http://node.demo.com/orders/order-book?currency=TST&with_currency=USDT',
      listedCoinOrderBookUrl:
          'https://server.justbit.co.in/orders/order-book?currency=RPT&with_currency=INR',
      inrRate: 77.0,
    );
  }

  Widget orderVolume() {
    return CoinOrderVolume(
      coinData: coinsList.elementAt(0),
      // listedCoinOrderBookUrl: 'http://node.demo.com/orders/order-book?currency=TST&with_currency=USDT',
      listedCoinOrderBookUrl:
          'https://server.justbit.co.in/orders/order-book?currency=RPT&with_currency=INR',
      inrRate: 77.0,
    );
  }

  Widget tradeHistory() {
    return CoinTradeHistory(
      coinData: coinsList.elementAt(0),
      listedCoinTradeHistoryAPIUrl:
          'http://node.demo.com/orders/trade-book?currency=TST&with_currency=USDT',
      itemCount: 15,
      inrRate: 77,
    );
  }

  Widget coinSearch() {
    return CoinSearch(
      coinsList: coinsList,
      currencyList: currencyList,
      tickerList: tickerList,
      inrRate: 77.0,
    );
  }
}

List<Coin> coinsList = [
  Coin(
      coinID: '1',
      coinImage: 'https://',
      coinName: 'Bitcoin',
      coinShortName: 'BTC',
      coinPrice: '123456',
      coinLastPrice: '123456',
      coinPercentage: '-0.5',
      coinSymbol: 'CVXUSDT',
      coinPairWith: 'USDT',
      coinHighDay: '567',
      coinLowDay: '12',
      coinDecimalPair: "3",
      coinDecimalCurrency: "4",
      coinListed: false),
  // Coin(coinID: '1', coinImage: 'https://', coinName: 'Litecoin', coinShortName: 'LTC', coinPrice: '123456', coinLastPrice: '123456', coinPercentage: '-0.5', coinSymbol: 'LTCBNB', coinPairWith: 'BNB', coinHighDay: '567', coinLowDay: '12', coinDecimalPair: 3, coinDecimalCurrency: 4, coinListed: false),
  Coin(
      coinID: '2',
      coinImage: 'https://',
      coinName: 'Bitcoin',
      coinShortName: 'BTC',
      coinPrice: '123456',
      coinLastPrice: '123456',
      coinPercentage: '-0.5',
      coinSymbol: 'BTCINR',
      coinPairWith: 'INR',
      coinHighDay: '567',
      coinLowDay: '12',
      coinDecimalPair: "3",
      coinDecimalCurrency: "4",
      coinListed: false),
  Coin(
      coinID: '3',
      coinImage: 'https://',
      coinName: 'Binance USD',
      coinShortName: 'BUSD',
      coinPrice: '0.0005',
      coinLastPrice: '0.0005',
      coinPercentage: '-0.5',
      coinSymbol: 'BUSDBNB',
      coinPairWith: 'BNB',
      coinHighDay: '567',
      coinLowDay: '12',
      coinDecimalPair: "3",
      coinDecimalCurrency: "4",
      coinListed: false),
  Coin(
      coinID: '4',
      coinImage: 'https://',
      coinName: 'Dogecoin',
      coinShortName: 'DOGE',
      coinPrice: '123456',
      coinLastPrice: '123456',
      coinPercentage: '-0.5',
      coinSymbol: 'DOGEUSDT',
      coinPairWith: 'USDT',
      coinHighDay: '567',
      coinLowDay: '12',
      coinDecimalPair: "3",
      coinDecimalCurrency: "4",
      coinListed: false),
];

List<Coin> wishlistCoinsList = [
  Coin(
      coinID: '1',
      coinImage: 'https://',
      coinName: 'Ethereum',
      coinShortName: 'ETH',
      coinPrice: '123456',
      coinLastPrice: '123456',
      coinPercentage: '-0.5',
      coinSymbol: 'ETHUSDT',
      coinPairWith: 'USDT',
      coinHighDay: '567',
      coinLowDay: '12',
      coinDecimalPair: "3",
      coinDecimalCurrency: "4",
      coinListed: false)
];

List<String> currencyList = [
  'USDT',
  'INR',
  'BNB',
];

List<String> tickerList = [
  "btcusdt@ticker",
  "ethusdt@ticker",
  "winusdt@ticker",
  "dentusdt@ticker",
  "xrpusdt@ticker",
  "etcusdt@ticker",
  "dogeusdt@ticker",
  "bnbusdt@ticker",
  "cakeusdt@ticker",
  "maticusdt@ticker",
  "trxusdt@ticker",
  "usdcusdt@ticker",
  "sandusdt@ticker",
  "maticbtc@ticker",
  "polybtc@ticker",
  "bnbbtc@ticker",
  "xrpeth@ticker",
  "shibusdt@ticker",
];

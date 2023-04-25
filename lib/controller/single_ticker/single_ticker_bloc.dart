import 'package:rxdart/rxdart.dart';
import 'package:crypto_credit/models/single_market_ticker/single_ticker_model.dart';

class SingleTickerBLoc {
  final BehaviorSubject<SingleMarketTickerModel> _singleTicker =
      BehaviorSubject<SingleMarketTickerModel>();

  Stream<SingleMarketTickerModel> get singleSticker => _singleTicker.stream;
  addSingleSticker(SingleMarketTickerModel? e) => _singleTicker.sink.add(e!);

  dispose() {
    _singleTicker.drain([]);
    _singleTicker.close();
  }
}

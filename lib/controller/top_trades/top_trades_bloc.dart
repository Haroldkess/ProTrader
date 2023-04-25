import 'package:crypto_credit/models/top_trades/top_trades_model.dart';
import 'package:rxdart/rxdart.dart';

class TopTradesBloc {
  final _topTrades = BehaviorSubject<List<TopTradesModel>>();
  final _topTradesStats = BehaviorSubject<TopTradeStats>();

  Stream<List<TopTradesModel>> get topTrades => _topTrades.stream;
  addTopTrades(List<TopTradesModel>? e) => _topTrades.sink.add(e!);

  Stream<TopTradeStats> get topTradesStats => _topTradesStats.stream;
  addTopTradesStats(TopTradeStats? e) => _topTradesStats.sink.add(e!);

  dispose() {
    _topTrades.drain([]);
    _topTradesStats.drain("");
  }
}

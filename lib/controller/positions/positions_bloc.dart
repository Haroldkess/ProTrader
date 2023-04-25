import 'package:crypto_credit/models/positions_model/positions_model.dart';
import 'package:crypto_credit/models/positions_model/single_positions_model.dart';
import 'package:rxdart/rxdart.dart' as rx;

class PositionsBloc {
  final rx.BehaviorSubject<List<TradePositions>> _tradePositions =
      rx.BehaviorSubject<List<TradePositions>>();

  final rx.BehaviorSubject<SinglePostionsModel> _singleTradePosition =
      rx.BehaviorSubject<SinglePostionsModel>();

  final rx.BehaviorSubject<String> _tradeCount = rx.BehaviorSubject<String>();

  final rx.BehaviorSubject<List<SinglePostionsModel>> _singleTradePositionList =
      rx.BehaviorSubject<List<SinglePostionsModel>>();

  Stream<List<TradePositions>> get tradePosition => _tradePositions.stream;
  addTradePosition(List<TradePositions>? e) => _tradePositions.sink.add(e!);

  Stream<String> get count => _tradeCount.stream;
  addTradesCount(String? e) => _tradeCount.sink.add(e!);

  Stream<List<SinglePostionsModel>> get singlePositionList =>
      _singleTradePositionList.stream;
  addSingleTradePositionList(List<SinglePostionsModel>? e) =>
      _singleTradePositionList.sink.add(e!);

  Stream<SinglePostionsModel> get singleTradePosition =>
      _singleTradePosition.stream;

  SinglePostionsModel get single => _singleTradePosition.value;

  addSingleTradePosition(SinglePostionsModel? e) =>
      _singleTradePosition.sink.add(e!);

  dispose() {
    _tradePositions.close();
    _singleTradePosition.close();
    _singleTradePositionList.close();
  }
}

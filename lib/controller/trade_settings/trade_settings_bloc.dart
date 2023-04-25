import 'package:crypto_credit/models/single_market_ticker/single_ticker_model.dart';
import 'package:rxdart/rxdart.dart';

class TradeSettingsBLoc {
  // ignore: non_constant_identifier_names
  final BehaviorSubject<String> _position_id = BehaviorSubject<String>();

  Stream<String> get positionID => _position_id.stream;
  addPositionID(String? e) => _position_id.sink.add(e!);

  get body => {"position_id": _position_id.value};
}



 
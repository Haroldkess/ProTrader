import 'package:crypto_credit/models/earning_model/earnings_model.dart';
import 'package:rxdart/rxdart.dart';

class EarningsBloc {
  final _earningsStats = BehaviorSubject<Earnings>();
  final _earningsPostions = BehaviorSubject<List<EarningsPositions>>();

  Stream<Earnings> get earningStats => _earningsStats.stream;
  addEarningStats(Earnings? e) => _earningsStats.sink.add(e!);

  Stream<List<EarningsPositions>> get earningPositions =>
      _earningsPostions.stream;
  addEarningPositions(List<EarningsPositions>? e) =>
      _earningsPostions.sink.add(e!);

  dispose() {
    _earningsPostions.close();
    _earningsStats.close();
    _earningsPostions.drain([]);
  }
}

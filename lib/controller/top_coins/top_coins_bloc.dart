import 'package:crypto_credit/models/top_coins/top_coins_model.dart';
import 'package:rxdart/rxdart.dart';

class TopCoinsBloc {
  final _topCoins = BehaviorSubject<List<TopCoinsModel>>();

  Stream<List<TopCoinsModel>> get topCoins => _topCoins.stream;
  addTopCoins(List<TopCoinsModel>? e) => _topCoins.sink.add(e!);
}

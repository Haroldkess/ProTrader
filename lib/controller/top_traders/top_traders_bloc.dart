import 'package:crypto_credit/models/top_traders/top_traders_models.dart';
import 'package:rxdart/rxdart.dart';

class TopTradersBloc {
  final _topTraders = BehaviorSubject<List<TopTradersModel>>();

  Stream<List<TopTradersModel>> get topTraders => _topTraders.stream;
  addTopTraders(List<TopTradersModel>? e) => _topTraders.sink.add(e!);

}

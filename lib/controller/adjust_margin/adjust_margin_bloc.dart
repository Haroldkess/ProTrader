import 'package:rxdart/rxdart.dart';

class AdjustMarginBLoc {
  final BehaviorSubject<String> _postionID = BehaviorSubject<String>.seeded("");

  final BehaviorSubject<String> _size = BehaviorSubject<String>.seeded("");

  Stream<String> get postionID => _postionID.stream;
  addPostionID(String? e) => _postionID.sink.add(e!);

  Stream<String> get size => _size.stream;
  addSize(String? e) => _size.sink.add(e!);

  Stream<bool> get canContinue => Rx.combineLatest([_size], (values) => true);

  get body =>
      {"position_id": _postionID.value, "size": _size.value, "trader": "AUTO"};
}

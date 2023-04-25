import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ScaffBloc {
  final BehaviorSubject<GlobalKey<ScaffoldState>> _sb =
      BehaviorSubject<GlobalKey<ScaffoldState>>();

  Stream<GlobalKey<ScaffoldState>> get d => _sb.stream;
  addKey(GlobalKey<ScaffoldState> e) => _sb.sink.add(e);

  dispose() async {
    _sb.drain();
    await _sb.close();
  }
}

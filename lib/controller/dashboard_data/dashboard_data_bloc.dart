// ignore: depend_on_referenced_packages
import 'package:crypto_credit/views/landing_screens/landing_screen.dart';
import 'package:rxdart/rxdart.dart';
import 'package:crypto_credit/models/dashboard_data/dashboard_data_model.dart';

class DashboardDataBLoc {
  final _mode = BehaviorSubject<String>();
  final _dashBoardData = BehaviorSubject<DashboardData>();

  Stream<String> get mode => _mode.stream;
  addMode(String? e) => _mode.sink.add(e ?? "LIVE");

  Stream<DashboardData> get dashBoardData => _dashBoardData.stream;
  addDashBoardData(DashboardData? e) => _dashBoardData.sink.add(e!);
  DashboardData get getDashboardData =>
      _dashBoardData.hasValue ? _dashBoardData.value : DashboardData();
  get body => {"mode": _mode.value};
  dispose() {
    _dashBoardData.drain("");
    _mode.close();
    _dashBoardData.close();
    _mode.drain("");
  }
}

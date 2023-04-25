import 'package:crypto_credit/controller/field_validations/validations.dart';
import 'package:crypto_credit/models/robot/robot_model.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:rxdart/rxdart.dart';

class RobotSettingsBLoc with FieldValidation {
  final _trader = BehaviorSubject<String>();
  final _myCost = BehaviorSubject<String>();
  final _leverage = BehaviorSubject<String>();
  final _takeProfit = BehaviorSubject<String>();
  final _totalCost = BehaviorSubject<String>();
  final _cycles = BehaviorSubject<String>();

  final _marginCallLimit = BehaviorSubject<String>();
  final BehaviorSubject<RobotSettingsModel> _robotSettings =
      BehaviorSubject<RobotSettingsModel>();

  Stream<RobotSettingsModel> get robotSettings => _robotSettings.stream;
  addRobotSettings(RobotSettingsModel? e) => _robotSettings.sink.add(e!);

  RobotSettingsModel get robot => _robotSettings.value;

  Stream<String> get trader => _trader.stream.transform(validInput);
  addTrader(String? e) => _trader.sink.add(e!);

  Stream<String> get marginCallLimit =>
      _marginCallLimit.stream.transform(validInput);
  addMarginCall(String? e) => _marginCallLimit.sink.add(e!);

  Stream<String> get noOfCycles => _cycles.stream.transform(validInput);
  addCycles(String? e) => _cycles.sink.add(e!);

  Stream<String> get myCost => _myCost.stream.transform(validInput);
  addMyCost(String? e) => _myCost.sink.add(e!);

  Stream<String> get leverage => _leverage.stream.transform(validInput);
  addLeverage(String? e) => _leverage.sink.add(e!);

  Stream<String> get takeProfit => _takeProfit.stream.transform(validInput);
  addTakeProfit(String? e) => _takeProfit.sink.add(e!);

  Stream<String> get totalCost => _totalCost.stream.transform(validInput);
  addTotal(String? e) => _totalCost.sink.add(e!);

  Stream<bool> get canSave => Rx.combineLatest4(
      trader, leverage, takeProfit, myCost, (a, b, c, d) => true);

  get body => {
        "id": $user.user.id,
        "robot_settings": {
          "margins": [],
          "cycles": [],
          "no_of_cycles": _cycles.value == "null"
              ? $robotSettings.robot.noOfCycles
              : _cycles.value,
          "marginCallLimit": _marginCallLimit.value == "null"
              ? $robotSettings.robot.marginCallLimit
              : _marginCallLimit.value,
          "trader": _trader.value,
          "myCost": _myCost.value,
          "leverage": _leverage.value,
          "total_cost": _totalCost.value,
          "takeProfit": _takeProfit.value
        }
      };
  void dispose() {}
}

// import 'package:crypto_credit/controller/field_validations/validations.dart';
// import 'package:crypto_credit/service_locator.dart';
// import 'package:rxdart/rxdart.dart';

// class CreateOrderBLoc with FieldValidation {
//   final _symbol = BehaviorSubject<String>();
//   final _side = BehaviorSubject<String>();
//   final _user = BehaviorSubject<String>();
//   final _mode = BehaviorSubject<String>();
//   final _leverage = BehaviorSubject<String>();
//   final _marginType = BehaviorSubject<String>();
//   final _trader = BehaviorSubject<String>();
//   final _cost = BehaviorSubject<String>();

//   final _myCost = BehaviorSubject<String>();
//   final _totalCost = BehaviorSubject<String>();
//   final _noOfCycle = BehaviorSubject<String>();

//   final _takeProfit = BehaviorSubject<String>();

//   Stream<String> get symbol => _symbol.stream;
//   addSymbol(String? e) => _symbol.sink.add(e!);

//   Stream<String> get myCost => _myCost.stream;
//   addMyCost(String? e) => _myCost.sink.add(e!);

//   Stream<String> get takeProfit => _takeProfit.stream.transform(validInput);
//   addTakeProfit(String? e) => _takeProfit.sink.add(e!);

//   Stream<String> get side => _side.stream;
//   addSide(String? e) => _side.sink.add(e!);

//   Stream<String> get user => _user.stream;
//   addUser(String? e) => _user.sink.add(e!);

//   Stream<String> get mode => _mode.stream;
//   addMode(String? e) => _mode.sink.add(e!);

//   Stream<String> get leverage => _leverage.stream;
//   addLeverage(String? e) => _leverage.sink.add(e!);

//   Stream<String> get marginType => _marginType.stream;
//   addMarginType(String? e) => _marginType.sink.add(e!);

//   Stream<String> get cost => _cost.stream;
//   addCost(String? e) => _cost.sink.add(e!);

//   Stream<String> get trader => _trader.stream;
//   addTrader(String? e) => _trader.sink.add(e!);

//   Stream<String> get totalCost => _totalCost.stream;
//   addTotalCost(String? e) => _totalCost.sink.add(e!);

//   Stream<String> get noOfcylce => _noOfCycle.stream;
//   addNoOfCycle(String? e) => _noOfCycle.sink.add(e!);

//   get body => {
//         "symbol": _symbol.value,
//         "entry_type": "MARKET",
//         "side": _side.value,
//         "cost": 2,
//         //  _cost.value == "null"
//         //     ? $robotSettings.robot.totalCost
//         //     : _cost.value,
//         "leverage": _leverage.value == "null"
//             ? $robotSettings.robot.leverage
//             : _leverage.value,
//         "margin_type": "FIRST",
//         "mode": $dashboardDataBloc.getDashboardData.mode,
//         "marginCallLimit": 1,
//         "margins": [],
//         "myCost": _myCost.value == "null"
//             ? $robotSettings.robot.myCost
//             : _myCost.value,
//         "no_of_cycles": _noOfCycle.value == "null"
//             ? $robotSettings.robot.noOfCycles
//             : _noOfCycle.value,
//         "takeProfit": _takeProfit.value == "null"
//             ? $robotSettings.robot.takeProfit
//             : _takeProfit.value,
//         "total_cost": _totalCost.value == "null"
//             ? $robotSettings.robot.totalCost
//             : _totalCost.value,
//         "trader": _trader.value == "null"
//             ? $robotSettings.robot.trader
//             : _trader.value,
//       };

//   dispose() {
//     _symbol.close();
//     _user.close();
//     _cost.close();
//     _leverage.close();
//     _marginType.close();
//     _mode.close();
//     _side.close();
//     _trader.close();
//   }
// }

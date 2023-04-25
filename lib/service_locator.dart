import 'package:crypto_credit/controller/adjust_margin/adjust_margin_bloc.dart';
import 'package:crypto_credit/controller/dashboard_data/dashboard_data_bloc.dart';
import 'package:crypto_credit/controller/earnings/earnings_bloc.dart';
import 'package:crypto_credit/controller/forgot_password/forgot_password_bloc.dart';
import 'package:crypto_credit/controller/login/login_bloc.dart';
import 'package:crypto_credit/controller/notifications/notifications_bloc.dart';
import 'package:crypto_credit/controller/positions/positions_bloc.dart';
import 'package:crypto_credit/controller/registeration/register_bloc.dart';
import 'package:crypto_credit/controller/robot_settings/robot_settings_bloc.dart';
import 'package:crypto_credit/controller/scaff_bloc.dart';
import 'package:crypto_credit/controller/single_ticker/single_ticker_bloc.dart';
import 'package:crypto_credit/controller/toggle_password_visibility/toggle_password_visibility_bloc.dart';
import 'package:crypto_credit/controller/top_coins/top_coins_bloc.dart';
import 'package:crypto_credit/controller/top_traders/top_traders_bloc.dart';
import 'package:crypto_credit/controller/top_trades/top_trades_bloc.dart';
import 'package:crypto_credit/controller/trade_settings/trade_settings_bloc.dart';
import 'package:crypto_credit/controller/update_demo_balance/update_demo.dart';
import 'package:crypto_credit/controller/user/user_bloc.dart';
import 'package:crypto_credit/views/authentication/login/login_screens.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

closeAll(context) async {
  Navigator.popUntil(context, (route) => route.isFirst);
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  await locator.reset();
}

initializesingletons() {
  locator.registerLazySingleton(() => ScaffBloc());
  locator.registerLazySingleton(() => LoginBloc());
  locator.registerLazySingleton(() => RegisterBloc());
  locator.registerLazySingleton(() => UserBloc());
  locator.registerLazySingleton(() => ForgotPasswordBLoc());
  locator.registerLazySingleton(() => NotifcationsBLoc()); 
  locator.registerLazySingleton(() => ResetPasswordBLoc());
  locator.registerLazySingleton(() => TopTradersBloc());
  locator.registerLazySingleton(() => PositionsBloc());
  locator.registerLazySingleton(() => TopTradesBloc());
  locator.registerLazySingleton(() => DashboardDataBLoc());
  locator.registerLazySingleton(() => TopCoinsBloc());
  locator.registerLazySingleton(() => RobotSettingsBLoc());
  locator.registerLazySingleton(() => EarningsBloc());
  locator.registerLazySingleton(() => TradeSettingsBLoc());
  locator.registerLazySingleton(() => TogglePasswordVisibilityBloc());
  locator.registerLazySingleton(() => UpdateDemoBLoc());
  locator.registerLazySingleton(() => SingleTickerBLoc());
  locator.registerLazySingleton(() => AdjustMarginBLoc());
}

ScaffBloc get $s => locator.get<ScaffBloc>();
LoginBloc get $loginBloc => locator.get<LoginBloc>();
UserBloc get $user => locator.get<UserBloc>();
ForgotPasswordBLoc get $fPassword => locator.get<ForgotPasswordBLoc>();
RegisterBloc get $registerBloc => locator.get<RegisterBloc>();
EarningsBloc get $earnings => locator.get<EarningsBloc>();
AdjustMarginBLoc get $adjustMargin => locator.get<AdjustMarginBLoc>();
UpdateDemoBLoc get $updateDemo => locator.get<UpdateDemoBLoc>();
TogglePasswordVisibilityBloc get $passwordToggle =>
    locator.get<TogglePasswordVisibilityBloc>();
TradeSettingsBLoc get $tradeSettingsBLoc => locator.get<TradeSettingsBLoc>();
DashboardDataBLoc get $dashboardDataBloc => locator.get<DashboardDataBLoc>();
ResetPasswordBLoc get $resetPassword => locator.get<ResetPasswordBLoc>();
PositionsBloc get $positions => locator.get<PositionsBloc>();
TopTradersBloc get $topTraders => locator.get<TopTradersBloc>();
TopTradesBloc get $topTrades => locator.get<TopTradesBloc>();
TopCoinsBloc get $topCoins => locator.get<TopCoinsBloc>();
SingleTickerBLoc get $singleSticker => locator.get<SingleTickerBLoc>();
// CreateOrderBLoc get $createOrder => locator.get<CreateOrderBLoc>();
RobotSettingsBLoc get $robotSettings => locator.get<RobotSettingsBLoc>();
NotifcationsBLoc get $notificationsBloc => locator.get<NotifcationsBLoc>();

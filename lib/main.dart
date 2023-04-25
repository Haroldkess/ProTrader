// ignore_for_file: use_build_context_synchronously
import 'package:crypto_credit/controller/positions/positions_requests.dart';
import 'package:crypto_credit/controller/theme_modes/theme_controller.dart';
import 'package:crypto_credit/controller/theme_modes/theme_provider.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/authentication/splash_screens.dart';
import 'package:crypto_credit/views/themes/app_theme.dart';
import 'package:crypto_credit/views/trade_socket.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/alert/alert_fuction.dart';
import 'controller/init_providers/provider_init.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initNotificationWorker();
  initializesingletons();
  runApp(MultiProvider(
      providers: InitProvider.providerInit(), child: const MyApp()));
}

GlobalKey<ScaffoldMessengerState> scaff = GlobalKey();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    ProjectOperations.checkTheme(context); // checking saved theme
  }

  // This widget is the root of your application ok seen.
  @override
  Widget build(BuildContext context) {
    ThemeAndUtilsProvider stream = context.watch<ThemeAndUtilsProvider>();
    // NetworkLogic.startListeningToNetworkStatus(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: scaff,
        title: 'ProTrader',
        theme: stream.isDark ? darkAppTheme : lightAppTheme,
        home: const SplashScreen());
  }
}

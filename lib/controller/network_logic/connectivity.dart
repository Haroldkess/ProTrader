import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/widgets/custom_alerts.dart';
import 'package:flutter/material.dart';

// import '../../main.dart';

// class NetworkLogic {
//   static startListeningToNetworkStatus(BuildContext? context) {
//     Connectivity connectivity = Connectivity();
//     connectivity.onConnectivityChanged.listen((event) {
//       scaff.currentState?.clearSnackBars();
//       if (event == ConnectivityResult.none) {
//         showErrorDialog(context!, "No Internet Connecttion",
//             "Check your internet connection", "Retry!", () {});
//       } else {
//         scaff.currentState?.showSnackBar(SnackBar(
//           content: const Text("Network Available"),
//           backgroundColor: appGreen,
//           duration: const Duration(seconds: 5),
//         ));
//       }
//     });
//   }
// }

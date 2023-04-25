// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crypto_credit/controller/network_logic/constants.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/authentication/login/login_screens.dart';
import 'package:crypto_credit/views/widgets/custom_alerts.dart';
import 'package:crypto_credit/views/widgets/log.dart';
import 'package:crypto_credit/views/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'apis.dart';

delete({
  @required String? url,
  String? token,
  BuildContext? context,
}) async {
  if (context != null) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    progressIndicator(context);
  }

  url = API.BASE_URL + url!;
  var uri = Uri.parse(url);
  dynamic result;
  dynamic data;

  try {
    result = await http.delete(uri, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    }).timeout(timeout);
    data = json.decode(result.body);
    if ((result as http.Response).statusCode == 404 && token != null) {
      await closeAll(context!);
      initializesingletons();
      return Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  } catch (err) {
    switch (err) {
      case SocketException:
        data = "Socket Exception";
        break;
      case TimeoutException:
        data = "Time Exception";
        break;
      default:
        data = err;
    }
  }

  return {
    "data": data,
  };
}

put(
    {Map<String, dynamic>? body,
    @required String? url,
    String? token,
    BuildContext? context}) async {
  FocusScopeNode currentFocus = FocusScope.of(context!);

  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }

  progressIndicator(context);
  var uri = Uri.parse(url!);
  var result;
  var data;

  try {
    result = await http.put(uri, body: json.encode(body), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    }).timeout(timeout);
    data = json.decode(result.body);
  } catch (err) {
    switch (err) {
      case SocketException:
        data = "Socket Exception";
        result.statusCode = 504;
        Navigator.pop(context);

        break;
      case TimeoutException:
        data = "Time Exception";
        result.statusCode = 408;
        Navigator.pop(context);
        break;
      default:
        data = err;
    }
  }

  Navigator.pop(context);
  return {
    "data": data,
  };
}

// post({
//   BuildContext? context,
//   @required String? url,
//   String? token,
//   Map<String, dynamic>? body,
//   String? message,
// }) async {
//   if (context != null) {
//     FocusScopeNode currentFocus = FocusScope.of(context);
//     if (!currentFocus.hasPrimaryFocus) {
//       currentFocus.unfocus();
//     }
//     progressIndicator(context, message: message);
//   }

//   var uri = Uri.parse(url!);
//   var response;
//   var data;

//   try {
//     response = await http.post(
//       uri,
//       body: jsonEncode(body),
//       headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'},
//     ).timeout(timeout);

//     data = jsonDecode(response.body);
//   } on SocketException catch (e) {
//     data = "Socket Exception: $e";
//   } on TimeoutException catch (e) {
//     data = "Timeout Exception: $e";
//   } on FormatException catch (e) {
//     data = "Format Exception: $e";
//   } catch (e) {
//     data = "Exception: $e";
//   }

//   if (context != null) {
//     Navigator.pop(context);
//   }

//   return {"data": data, "status_code": response?.statusCode ?? 504};
// }

post(
    {Map<String, dynamic>? body,
    required String? url,
    String? token,
    String? message,
    BuildContext? context,
    bool? isTrade, bool? isSWitch}) async {
  if (context != null && isSWitch != true) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    progressIndicator(context, message: message);
  }

  url = API.BASE_URL + url!;
  var uri = Uri.parse(url);
  var result;
  var data;

  // log(url);

  try {
    result = await http.post(uri, body: jsonEncode(body!), headers: {
      'Content-Type': 'application/json',
      'Authorization': $user.accessToken == null
          ? 'Bearer $token'
          : 'Bearer ${$user.accessToken}'
    }).timeout(timeout);
    data = json.decode(result.body);
  }
  // on SocketException catch (e) {
  //   log("SOCKET EXCEPTION $e");
  // }
  on TimeoutException catch (e) {
    log("TIMEOUT EXCEPTION $e");
  } on FormatException catch (e) {
    log("FORMAT EXCEPTION $e");
  } catch (err) {
    data = "Exception: $err";
    // switch (err) {
    //   case FormatException:
    //     data = "Format Exception";
    //     showToast(context, data);
    //     break;

    //   case SocketException:
    //     result.statusCode = 504;
    //     data = "Socket Exception";

    //     Navigator.pop(context!);
    //     if (context != null) {
    //       showToast(context, data);
    //       Navigator.pop(context);
    //     }

    //     break;
    //   case TimeoutException:
    //     result.statusCode = 408;
    //     data = "Time Exception";
    //     if (context != null) {
    //       // showErrorMessage(data, context);
    //       Navigator.pop(context);
    //     }
    //     break;
    //   default:
    //     data = err;
    // }
  }

  if (context != null && isTrade != true  && isSWitch != true) {
    Navigator.pop(context);
  }

  return {
    "data": data,
    "status_code": result != null ? result.statusCode : 504
  };
}

patch(
    {Map<String, dynamic>? body,
    required String? url,
    String? token,
    BuildContext? context}) async {
  if (context != null) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    progressIndicator(context);
  }

  url = API.BASE_URL + url!;
  var uri = Uri.parse(url);
  var result;
  var data;

  try {
    result = await http.patch(uri, body: json.encode(body), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    }).timeout(timeout);
    data = json.decode(result.body);
    if ((result as http.Response).statusCode == 404 && token != null) {
      await closeAll(context!);
      initializesingletons();

      // showErrorMessage("Session Expired. Please Login Again", context!);
      return Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  } catch (err) {
    switch (err) {
      case SocketException:
        data = "Socket Exception";
        if (context != null) {
          Navigator.pop(context);
        }
        break;
      case TimeoutException:
        // Navigator.pop(context);
        data = "Time Exception";
        if (context != null) {
          Navigator.pop(context);
        }
        break;
      default:
        data = err;
    }
  }

  if (context != null) {
    Navigator.pop(context);
  }
  return {
    "data": data,
    "status_code": result != null ? result.statusCode : 504
  };
}

get(
    {@required String? url,
    String? token,
    BuildContext? context,
    bool? stopClose}) async {
  if (context != null) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (stopClose == null) {
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }
  }

  url = API.BASE_URL + url!;
  var uri = Uri.parse(url);
  var result;
  var data;

  try {
    result = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    }).timeout(timeout);
    data = json.decode(result.body);
    // if ((result as http.Response).statusCode == 404 && token == null) {
    //   await closeAll();
    //   serviceLocator();

    //   showMessage("Session Expired. Please Login Again", context);
    //   return Navigator.pushReplacement(
    //       context!, MaterialPageRoute(builder: (context) => Login()));
    // }
  } catch (err) {
    switch (err) {
      case SocketException:
        data = "Socket Exception";
        result.statusCode = 504;
        break;
      case TimeoutException:
        data = "Time Exception";
        result.statusCode = 408;
        break;
      default:
        data = err;
    }
  }

  return {
    "data": data,
    "status_code": result != null ? result.statusCode : 504
  };
}

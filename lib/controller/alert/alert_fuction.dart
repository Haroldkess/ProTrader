import 'dart:convert';
import 'package:crypto_credit/controller/alert/alert.office.dart';
import 'package:crypto_credit/controller/alert/alert_model.dart';
import 'package:workmanager/workmanager.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:crypto_credit/controller/keys/pref_keys.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
const taskName = "notification";
SharedPreferences? pref;
//initialize the workmanager for notification
initNotificationWorker() async {
 // collectNotificationFromApi();
  await Workmanager()
      .initialize(callbackDispatcher, isInDebugMode: false)
      .whenComplete(() => print("competed"));
  await Workmanager()
      .registerPeriodicTask(taskName, taskName,
          frequency: const Duration(minutes: 15),
          constraints: Constraints(networkType: NetworkType.connected))
      .whenComplete(() => print("completed"));
}

// call dispatcher to triger the notification function
callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    await collectNotificationFromApi();
    return Future.value(true);
  });
}

Future collectNotificationFromApi() async {
  pref = await SharedPreferences.getInstance(); // init pref
  late List<AlertData>
      latesAlert; //  would hold the latest notification in the future
  String id = DateTime.now().second.toString();

// run notification registerations
  var initializationSettingsAndroid =
      const AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettingsIOS = const IOSInitializationSettings();

  var initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  WidgetsFlutterBinding.ensureInitialized();

  flutterLocalNotificationsPlugin!.initialize(
    initializationSettings,
  );
  print("hello....");
  // check for user token.... would stop if token doesnt exist
  if (!pref!.containsKey(tokenKey)) return;
  bool shouldBeep = pref!.getBool(showNotifyKey) ?? true;
  print("token dey");

  http.Response? response;

  response =
      await getNotification(); // call for all notifications notifications
  if (response == null) {
  } else if (response.statusCode == 200) {
    // decode and store them in models
    var jsonData = jsonDecode(response.body);
    AlertModel alert = AlertModel.fromJson(jsonData);
    latesAlert = alert.data!;

    if (!pref!.containsKey(notificationKey)) {
      // check for stored value in pref
      pref!.setStringList(notificationKey,
          ["value"]); // stores a value if it doesnt exist before
    }

    if (latesAlert.first.id.toString() ==
        pref!.getStringList(notificationKey)!.first.toString()) {
      // compares latest notification id with stored notification id
      print("no new notification");
      return;
    }
    print("New notification detected");

// complete notification initializations
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings();

    InitializationSettings initializationSettings =
        const InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    WidgetsFlutterBinding.ensureInitialized();

    flutterLocalNotificationsPlugin!.initialize(
      initializationSettings,
    );
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
            id, latesAlert.first.title!, latesAlert.first.message!,
            importance: Importance.high,
            priority: Priority.high,
            playSound: shouldBeep,
            enableVibration: true,
            visibility: NotificationVisibility.public);
    var iOSPlatformChannelSpecifics = const IOSNotificationDetails(
      threadIdentifier: 'thread_id',
    );
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

// show notification on phone
    await flutterLocalNotificationsPlugin!.show(
      int.tryParse(id)!,
      latesAlert.first.title!,
      latesAlert.first.message!,
      platformChannelSpecifics,
    );

    pref!.setStringList(notificationKey, [
      latesAlert.first.id.toString()
    ]); // replace old notification id with newly send notification id
  } else {
    print("oh we failed you");
  }
}

// compare times from current time and new notification time
int timeBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inMinutes).round();
}

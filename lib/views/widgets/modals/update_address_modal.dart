import 'package:workmanager/workmanager.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

void old() {

// needed if you intend to initialize in the `main` function
WidgetsFlutterBinding.ensureInitialized();
Workmanager().initialize(
	
	// The top level function, aka callbackDispatcher
	callbackDispatcher,
	
	// If enabled it will post a notification whenever
	// the task is running. Handy for debugging tasks
	isInDebugMode: true
);
// Periodic task registration
Workmanager().registerPeriodicTask(
	"2",
	
	//This is the value that will be
	// returned in the callbackDispatcher
	"simplePeriodicTask",
	
	// When no frequency is provided
	// the default 15 minutes is set.
	// Minimum frequency is 15 min.
	// Android will automatically change
	// your frequency to 15 min
	// if you have configured a lower frequency.
	frequency: Duration(minutes: 15),
);

}

void callbackDispatcher() {
Workmanager().executeTask((task, inputData) {
	
	// initialise the plugin of flutterlocalnotifications.
	FlutterLocalNotificationsPlugin flip = new FlutterLocalNotificationsPlugin();
	
	// app_icon needs to be a added as a drawable
	// resource to the Android head project.
	var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
	var IOS = new IOSInitializationSettings();
	
	// initialise settings for both Android and iOS device.
	var settings = new InitializationSettings(android: android, iOS: IOS);
	flip.initialize(settings);
	_showNotificationWithDefaultSound(flip);
	return Future.value(true);
});
}

Future _showNotificationWithDefaultSound(flip) async {

// Show a notification after every 15 minute with the first
// appearance happening a minute after invoking the method
var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
	'your channel id',
	'your channel name',
	'your channel description',
	importance: Importance.high,
	priority: Priority.high
);
var iOSPlatformChannelSpecifics = new IOSNotificationDetails();

// initialise channel platform for both Android and iOS device.
var platformChannelSpecifics =  NotificationDetails(
	android: androidPlatformChannelSpecifics,
	iOS: iOSPlatformChannelSpecifics
);
await flip.show(0, 'GeeksforGeeks',
	'Your are one step away to connect with GeeksforGeeks',
	platformChannelSpecifics, payload: 'Default_Sound'
);
}


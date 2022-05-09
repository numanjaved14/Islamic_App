// import 'package:firebase_core/firebase_core.dart';

import 'package:timezone/timezone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamicapp/authentications/landing_scr.dart';
import 'package:islamicapp/authentications/providers/user_provider.dart';
import 'package:islamicapp/mainpage/IslamicFeed/controllers/auth_controller.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Future<void> _configureLocalTimeZone() async {
//   tz.initializeTimeZones();
//   final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
//   tz.setLocalLocation(tz.getLocation(timeZoneName!));
// }

String? selectedNotificationPayload;
var initialzationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/launcher_icon');
var android = new AndroidNotificationDetails(
  "channelId",
  "channelName",
  // "channelDescription",
);
var ios = new IOSNotificationDetails();
var details = new NotificationDetails(android: android, iOS: ios);
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  // 'This channel is used for important notifications.', // description
  importance: Importance.high,
);
var generate = new NotificationDetails();

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  //   await Firebase.initializeApp(

  WidgetsFlutterBinding.ensureInitialized();
  // await _configureLocalTimeZone();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  var initialzationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/launcher_icon');
  var initializationSettings = InitializationSettings(
    android: initialzationSettingsAndroid,
  );

  flutterLocalNotificationsPlugin.initialize(initializationSettings);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Gilroy',
          primarySwatch: Colors.red,
        ),
        home: LandingScreen(),
        // home: AlarmPage(title: 'abcs'),
      ),
    );
  }
}

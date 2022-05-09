import 'package:adhan_dart/adhan_dart.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:islamicapp/main.dart';
import 'package:timezone/timezone.dart' as tz;

class ScheduleNotification {
  
  final location = tz.getLocation('Pakistan/Karachi');
  Future<void> schedulefajrNotification(PrayerTimes time) async {
    print("Schedule");
    await flutterLocalNotificationsPlugin.zonedSchedule(
        1,
        'Fajar Prayer Time',
        'Fajr Prayer Time Please Stand Up and GO for prayer',
        tz.TZDateTime.from(time.fajr!,location),
        const NotificationDetails(
          android: AndroidNotificationDetails(
              "Fajar Prayer Time", 'daily notification channel name',
              // 'daily notification description',
              sound: RawResourceAndroidNotificationSound("azan"),
              playSound: true,
              priority: Priority.high,
              autoCancel: false,
              styleInformation: BigPictureStyleInformation(
                  DrawableResourceAndroidBitmap("@mipmap/launcher_icon"),
                  largeIcon:
                      DrawableResourceAndroidBitmap("@mipmap/launcher_icon"))),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  Future<void> scheduleDuhrNotification(PrayerTimes time) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        2,
        'Dhuhr Prayer Time',
        'Dhuhr Prayer Time Please Stand Up and GO for prayer',
       tz.TZDateTime.from(time.dhuhr!,location),
        const NotificationDetails(
          android: AndroidNotificationDetails(
              "Dhuhr Prayer Time", 'daily notification channel name',
              // 'daily notification description',
              sound: RawResourceAndroidNotificationSound("azan"),
              playSound: true,
              priority: Priority.high,
              autoCancel: false,
              styleInformation: BigPictureStyleInformation(
                  DrawableResourceAndroidBitmap("@mipmap/launcher_icon"),
                  largeIcon:
                      DrawableResourceAndroidBitmap("@mipmap/launcher_icon"))),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  Future<void> scheduleasrNotification(PrayerTimes time) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        3,
        'Asr Prayer Time',
        'Asr Prayer Time Please Stand Up and GO for prayer',
       tz.TZDateTime.from(time.asr!,location),
        const NotificationDetails(
          android: AndroidNotificationDetails(
              "Asr Prayer Time", 'daily notification channel name',
              // 'daily notification description',
              sound: RawResourceAndroidNotificationSound("azan"),
              playSound: true,
              priority: Priority.high,
              autoCancel: false,
              styleInformation: BigPictureStyleInformation(
                  DrawableResourceAndroidBitmap("@mipmap/launcher_icon"),
                  largeIcon:
                      DrawableResourceAndroidBitmap("@mipmap/launcher_icon"))),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  Future<void> scheduleMaghribNotification(PrayerTimes time) async {
    print("configured ${time.maghrib}");
    await flutterLocalNotificationsPlugin.zonedSchedule(
        4,
        'Maghrib Prayer Time',
        'Maghrib Prayer Time Please Stand Up and GO for prayer',
       tz.TZDateTime.from(time.maghrib!,location),
        const NotificationDetails(
          android: AndroidNotificationDetails(
              "Maghrib Prayer Time", 'daily notification channel name',
              // 'daily notification description',
              sound: RawResourceAndroidNotificationSound("azan"),
              playSound: true,
              priority: Priority.high,
              autoCancel: false,
              styleInformation: BigPictureStyleInformation(
                  DrawableResourceAndroidBitmap("@mipmap/launcher_icon"),
                  largeIcon:
                      DrawableResourceAndroidBitmap("@mipmap/launcher_icon"))),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  Future<void> scheduleIshaNotification(PrayerTimes time) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        5,
        'Isha Prayer Time',
        'Isha Prayer Time Please Stand Up and GO for prayer',
        tz.TZDateTime.from(time.isha!,location),
        const NotificationDetails(
          android: AndroidNotificationDetails(
              "Isha Prayer Time", 'daily notification channel name',
              // 'daily notification description',
              sound: RawResourceAndroidNotificationSound("azan"),
              playSound: true,
              priority: Priority.high,
              autoCancel: false,
              styleInformation: BigPictureStyleInformation(
                  DrawableResourceAndroidBitmap("@mipmap/launcher_icon"),
                  largeIcon:
                      DrawableResourceAndroidBitmap("@mipmap/launcher_icon"))),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }
}

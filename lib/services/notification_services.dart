// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/timezone.dart' as tz;
//
// class NotificationService {
//   //Singleton pattern
//   static final NotificationService _notificationService =
//   NotificationService._internal();
//   factory NotificationService() {
//     return _notificationService;
//   }
//   NotificationService._internal();
//
//   //instance of FlutterLocalNotificationsPlugin
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   final AndroidInitializationSettings initializationSettingsAndroid =
//   const AndroidInitializationSettings('app_icon');
//
//
//
//
//   Future<void> init() async {
//     //Initialization Settings for Android
//     ///Added app_icon in res/drawable myself to make it work
//     final AndroidInitializationSettings initializationSettingsAndroid = const AndroidInitializationSettings('app_icon');
//
//     //Initialization Settings for iOS
//     // final IOSInitializationSettings initializationSettingsIOS =
//     // IOSInitializationSettings(
//     //   requestSoundPermission: false,
//     //   requestBadgePermission: false,
//     //   requestAlertPermission: false,
//     // );
//
//     //InitializationSettings for initializing settings for both platforms (Android & iOS)
//     final InitializationSettings initializationSettings =
//     InitializationSettings(
//       android: initializationSettingsAndroid,
//       // iOS: initializationSettingsIOS
//     );
//
//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//     );
//   }
//
//
//
//   static Future _NotificationDetails() async {
//
//     const AndroidNotificationDetails _androidNotificationDetails =
//     AndroidNotificationDetails(
//       'channel ID',
//       'channel name',
//       playSound: true,
//       priority: Priority.max,
//       importance: Importance.max,
//     );
//
//     return const NotificationDetails(
//       android: _androidNotificationDetails,
//     );
//   }
//
//   Future<void> showNotifications({
//     int id = 0,
//     String? title,
//     String? body,
//     String? payload
//   }) async {
//     print("SHOW NOTICATION: METHOD");
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       '$title',
//       '$body',
//       await _NotificationDetails(),
//       payload: '${payload}',
//     );
//   }
//
//
//   Future<void> showScheduleNotification({
//     int id = 0,
//     String? title,
//     String? body,
//     String? payload,
//     required DateTime dateTime,
//   }) async {
//
//     print("SHOW NOTICATION: METHOD");
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//
//       0,
//       '$title',
//       '$body',
//       tz.TZDateTime.from(dateTime, tz.local),
//       await _NotificationDetails(),
//       payload: '${payload}',
//       uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
//     );
//   }
//
// }
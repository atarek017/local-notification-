import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

NotificationDetails get _ongoing {
  final androidChanelSpecification = AndroidNotificationDetails(
    'your chanel id',
    'your chanel name',
    'your chanel description',
    importance: Importance.Max,
    priority: Priority.High,
    ongoing: true,
    autoCancel: false,
  );

  final iosChanelSpecification = IOSNotificationDetails(presentSound: false);
  return NotificationDetails(
      androidChanelSpecification, iosChanelSpecification);
}

Future showOngoingNotification(FlutterLocalNotificationsPlugin notification,
        {@required String tittle, @required String body, int id = 0}) =>
    _showNotification(notification,
        tittle: tittle, body: body, type: _ongoing, id: id);

Future _showNotification(FlutterLocalNotificationsPlugin notification,
        {@required String tittle,
        @required String body,
        @required NotificationDetails type,
        int id = 0}) =>
    notification.show(id, tittle, body, type);

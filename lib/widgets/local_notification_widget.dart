import 'package:flutter/material.dart';
import 'package:flutter_notification/pages/secondPage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../local_notification_helper.dart';

class LocalNotificationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LocalNotificationWidgetState();
  }
}

class _LocalNotificationWidgetState extends State<LocalNotificationWidget> {
  final notifications = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();

    final settingsAndroid = AndroidInitializationSettings('app_icon');
    final settingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));
    notifications.initialize(
        InitializationSettings(settingsAndroid, settingsIOS),
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async {
    return await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SecondPage(
                  payload: payload,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListView(
        children: <Widget>[
          tittle("Basics"),
          RaisedButton(
            child: Text("Show Notification"),
            onPressed: () => showOngoingNotification(notifications,
                tittle: "Title", body: 'Body'),
          ),

          RaisedButton(
            child: Text("Replace Notification"),
            onPressed: () => showOngoingNotification(notifications,
                tittle: "replace Title", body: 'replace Body'),
          ),

          RaisedButton(
            child: Text("Other Notification"),
            onPressed: () => showOngoingNotification(notifications,
                tittle: "silentTitle", body: 'silentBody', id: 10),
          ),

          tittle("silient "),
          RaisedButton(
            child: Text("Show silient Notification"),
            onPressed: () => showOngoingNotification(notifications,
                tittle: "silentTitle", body: 'silentBody', id: 30),
          ),

          tittle("cancle "),
          RaisedButton(
            child: Text("cancle Notification"),
            onPressed: () => notifications.cancelAll(),
          )
        ],
      ),
    );
  }
}

Widget tittle(String tittle) {
  return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Text(
        tittle,
        textAlign: TextAlign.center,
      ));
}

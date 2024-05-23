import 'package:flutter/material.dart';
import 'package:ability_link1/utli/posts/notification_post.dart';

class Notification_page extends StatefulWidget {
  @override
  _Notification_pageState createState() => _Notification_pageState();
}

class _Notification_pageState extends State<Notification_page> {
  List<NotificationItem> notifications = [
    NotificationItem(
      isOnline: true,
      name: 'name',
      time: 'hours ago',
      title: 'has followed you',
    ),
    NotificationItem(
      isOnline: true,
      name: 'name',
      time: 'hours ago',
      title: 'has followed you',
    ),
    NotificationItem(
      isOnline: false,
      name: 'name',
      time: 'hours ago',
      title: 'has followed you',
    ),
    NotificationItem(
      isOnline: true,
      name: 'name',
      time: 'hours ago',
      title: 'has followed you',
    ),
    NotificationItem(
      isOnline: false,
      name: 'name',
      time: 'hours ago',
      title: 'has followed you',
    ),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Notifications',
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              return notification_post(
                isOnline: notifications[index].isOnline,
                name: notifications[index].name,
                time: notifications[index].time,
                title: notifications[index].title,
              );
            },
          ),
        ),
      );
}

class NotificationItem {
  final bool isOnline;
  final String name;
  final String time;
  final String title;

  NotificationItem({
    required this.isOnline,
    required this.name,
    required this.time,
    required this.title,
  });
}
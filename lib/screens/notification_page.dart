import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:osar_pasar/screens/active_booking.dart';

import '../controller/notification_controller.dart';
import '../models/notification.dart';

class NotificationPage extends StatelessWidget {
  final String notificationMessage;

  NotificationPage({super.key, required this.notificationMessage});

  final c = Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(Get.context!).textTheme;
    var theme = Theme.of(Get.context!);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: textTheme.titleLarge!.copyWith(
              fontSize: 18, color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: Obx(
        () => (c.loading.value)
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16),
                child: ListView.builder(
                  itemCount: c.notificationList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    NotificationServiceprovider notification =
                        c.notificationList[index];
                    return InkWell(
                      onTap: () {
                        Get.to(ActiveBooking());
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            notification.data!.note! ?? "",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 57, 57, 57)),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String notificationTitle;
  final String notificationMessage;

  NotificationCard({
    required this.notificationTitle,
    required this.notificationMessage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                NotificationPage(notificationMessage: notificationMessage),
          ),
        );
      },
      child: Card(
        child: ListTile(
          title: Text(
            notificationTitle,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            notificationMessage,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

class NotificationsList extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'title': 'Notification 1',
      'message':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam imperdiet leo eget dui varius, vel aliquam massa convallis. Integer at malesuada nulla.'
    },
    {
      'title': 'Notification 2',
      'message':
          'Praesent interdum eros euismod mi sagittis, ac imperdiet lorem interdum. Nulla vitae nulla placerat, vulputate sapien ac, blandit neque.'
    },
    {
      'title': 'Notification 3',
      'message':
          'Duis ullamcorper mauris ut arcu congue, id scelerisque quam elementum. Sed quis mauris eget velit dictum ultricies vel ac massa.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return NotificationCard(
          notificationTitle: "Notification title here",
          notificationMessage: "Small message",
        );
      },
    );
  }
}

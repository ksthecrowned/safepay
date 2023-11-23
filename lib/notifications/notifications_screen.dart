import 'package:flutter/material.dart';
import './notification_item.dart'; // Importer le composant de notification

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Exemple de liste de notifications avec des dates simulées
    List<Map<String, dynamic>> notificationList = [
      {'title': 'Notification 1', 'date': DateTime.now()},
      {
        'title': 'Notification 2',
        'date': DateTime.now().subtract(const Duration(days: 1))
      },
      {
        'title': 'Notification 3',
        'date': DateTime.now().subtract(const Duration(days: 2))
      },
      // ... Ajoutez d'autres notifications avec des dates différentes
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildNotificationGroup(
              'Aujourd\'hui', _filterNotifications(notificationList, 'today')),
          _buildNotificationGroup(
              'Hier', _filterNotifications(notificationList, 'yesterday')),
          _buildNotificationGroup(
              'Plus anciens', _filterNotifications(notificationList, 'older')),
        ],
      ),
    );
  }

  // Méthode pour créer un groupe de notifications regroupées
  Widget _buildNotificationGroup(
      String title, List<Map<String, dynamic>> notifications) {
    if (notifications.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Divider(),
        Column(
          children: notifications.map((notification) {
            return NotificationItem(
              title: notification['title'],
              description: notification['description'],
              iconData: notification['iconData'],
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  // Méthode pour filtrer les notifications en fonction de la date
  List<Map<String, dynamic>> _filterNotifications(
      List<Map<String, dynamic>> notificationList, String filter) {
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime yesterday = today.subtract(const Duration(days: 1));

    switch (filter) {
      case 'today':
        return notificationList
            .where(
                (notification) => notification['date'].isAtSameMomentAs(today))
            .toList();
      case 'yesterday':
        return notificationList
            .where((notification) =>
                notification['date'].isAtSameMomentAs(yesterday))
            .toList();
      case 'older':
        return notificationList
            .where((notification) => notification['date'].isBefore(yesterday))
            .toList();
      default:
        return [];
    }
  }
}

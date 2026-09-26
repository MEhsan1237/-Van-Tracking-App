import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Center'),
      ),
      body: ListView(
        padding: EdgeInsets.all(size.width * 0.045),
        children: [
          _buildNotificationTile(
            context,
            title: 'Van Started Journey',
            message: 'VAN-02 has started morning pickup route.',
            time: '10 mins ago',
            icon: Icons.directions_bus,
            color: AppColors.teal,
            isUnread: true,
          ),
          SizedBox(height: size.height * 0.01),
          _buildNotificationTile(
            context,
            title: 'Student Picked Up',
            message: 'Ali Ahmad (STU-101) boarded VAN-02 safely.',
            time: '25 mins ago',
            icon: Icons.check_circle,
            color: AppColors.success,
            isUnread: true,
          ),
          SizedBox(height: size.height * 0.01),
          _buildNotificationTile(
            context,
            title: 'Leave Approved',
            message: 'Leave request for 28th Sep has been approved by Admin.',
            time: '1 hour ago',
            icon: Icons.event_available,
            color: AppColors.warmGold,
            isUnread: false,
          ),
          SizedBox(height: size.height * 0.01),
          _buildNotificationTile(
            context,
            title: 'Monthly Transport Fee Due',
            message: 'September 2026 fee invoice of Rs. 3,500 is ready for payment.',
            time: 'Yesterday',
            icon: Icons.account_balance_wallet,
            color: Colors.purple.shade700,
            isUnread: false,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationTile(
    BuildContext context, {
    required String title,
    required String message,
    required String time,
    required IconData icon,
    required Color color,
    required bool isUnread,
  }) {
    final theme = Theme.of(context);
    return Card(
      color: isUnread ? color.withOpacity(0.06) : theme.cardColor,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.15),
          child: Icon(icon, color: color, size: 20),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: isUnread ? FontWeight.bold : FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 2),
            Text(message, style: const TextStyle(fontSize: 13)),
            const SizedBox(height: 4),
            Text(time, style: const TextStyle(fontSize: 11, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

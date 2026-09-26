import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final String? userPhotoUrl;
  final String? userName;
  final int notificationCount;
  final VoidCallback? onNotificationPressed;
  final VoidCallback? onProfilePressed;
  final List<Widget>? actions;

  const ResponsiveAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.userPhotoUrl,
    this.userName,
    this.notificationCount = 0,
    this.onNotificationPressed,
    this.onProfilePressed,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 8);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return AppBar(
      titleSpacing: size.width * 0.04,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (subtitle != null)
            Text(
              subtitle!,
              style: TextStyle(
                fontSize: (size.width * 0.032).clamp(11.0, 13.0),
                color: theme.colorScheme.onSurface.withOpacity(0.6),
                fontWeight: FontWeight.w500,
              ),
            ),
          Text(
            title,
            style: TextStyle(
              fontSize: (size.width * 0.048).clamp(18.0, 22.0),
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
      actions: [
        if (actions != null) ...actions!,
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_outlined),
              onPressed: onNotificationPressed,
            ),
            if (notificationCount > 0)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: AppColors.error,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                  child: Text(
                    '$notificationCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
        SizedBox(width: size.width * 0.01),
        GestureDetector(
          onTap: onProfilePressed,
          child: Padding(
            padding: EdgeInsets.only(right: size.width * 0.04),
            child: CircleAvatar(
              radius: (size.width * 0.045).clamp(16.0, 20.0),
              backgroundColor: AppColors.teal,
              backgroundImage: userPhotoUrl != null && userPhotoUrl!.isNotEmpty
                  ? NetworkImage(userPhotoUrl!)
                  : null,
              child: userPhotoUrl == null || userPhotoUrl!.isEmpty
                  ? Text(
                      userName != null && userName!.isNotEmpty
                          ? userName![0].toUpperCase()
                          : 'U',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}

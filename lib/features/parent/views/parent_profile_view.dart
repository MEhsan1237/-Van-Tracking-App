import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/theme_controller.dart';
import '../../auth/viewmodels/auth_viewmodel.dart';
import '../viewmodels/parent_viewmodel.dart';

class ParentProfileView extends GetView<ParentViewModel> {
  const ParentProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    final authVm = Get.find<AuthViewModel>();
    final themeCtrl = Get.find<ThemeController>();
    final user = authVm.currentUser.value;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile & Settings'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(size.width * 0.045),
        child: Column(
          children: [
            // Profile Header
            CircleAvatar(
              radius: size.width * 0.12,
              backgroundColor: AppColors.teal,
              child: Text(
                user?.name.isNotEmpty == true ? user!.name[0].toUpperCase() : 'P',
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            SizedBox(height: size.height * 0.015),
            Text(
              user?.name ?? 'Muhammad Ehsan',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              user?.email ?? 'parent@school.com',
              style: TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.65)),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.warmGold.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'ROLE: ${user?.role.name.toUpperCase() ?? 'PARENT'}',
                style: const TextStyle(color: AppColors.warmGold, fontWeight: FontWeight.bold, fontSize: 11),
              ),
            ),
            SizedBox(height: size.height * 0.03),

            // Settings Group
            Card(
              child: Column(
                children: [
                  Obx(() {
                    return ListTile(
                      leading: const Icon(Icons.palette_outlined, color: AppColors.teal),
                      title: const Text('Theme Mode'),
                      subtitle: Text(
                        themeCtrl.themeMode == ThemeMode.light
                            ? 'Light Theme'
                            : themeCtrl.themeMode == ThemeMode.dark
                                ? 'Dark Theme'
                                : 'System Default',
                      ),
                      trailing: DropdownButton<ThemeMode>(
                        value: themeCtrl.themeMode,
                        underline: const SizedBox.shrink(),
                        onChanged: (mode) {
                          if (mode != null) themeCtrl.setThemeMode(mode);
                        },
                        items: const [
                          DropdownMenuItem(value: ThemeMode.light, child: Text('Light')),
                          DropdownMenuItem(value: ThemeMode.dark, child: Text('Dark')),
                          DropdownMenuItem(value: ThemeMode.system, child: Text('System')),
                        ],
                      ),
                    );
                  }),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.people_outline, color: AppColors.teal),
                    title: const Text('Linked Children'),
                    subtitle: const Text('2 Students Assigned'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.notifications_none, color: AppColors.teal),
                    title: const Text('Push Notifications'),
                    subtitle: const Text('Enabled for Van Pickup/Drop'),
                    trailing: Switch(value: true, onChanged: (_) {}),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.security, color: AppColors.teal),
                    title: const Text('Security & Password'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => Get.toNamed('/forgot-password'),
                  ),
                ],
              ),
            ),

            SizedBox(height: size.height * 0.03),

            // Logout Button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                backgroundColor: AppColors.error,
                foregroundColor: Colors.white,
              ),
              onPressed: () => authVm.logout(),
              icon: const Icon(Icons.logout),
              label: const Text('Logout Account'),
            ),
          ],
        ),
      ),
    );
  }
}

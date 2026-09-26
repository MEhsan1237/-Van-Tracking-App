import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/app_cards.dart';
import '../../../shared/widgets/responsive_app_bar.dart';
import '../viewmodels/parent_viewmodel.dart';
import '../../auth/viewmodels/auth_viewmodel.dart';
import 'parent_leave_view.dart';

class ParentDashboardView extends GetView<ParentViewModel> {
  const ParentDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    final authVm = Get.find<AuthViewModel>();

    return Scaffold(
      appBar: ResponsiveAppBar(
        subtitle: 'Good Morning,',
        title: authVm.currentUser.value?.name ?? 'Muhammad',
        userName: authVm.currentUser.value?.name,
        notificationCount: 2,
        onNotificationPressed: () => Get.toNamed('/notifications'),
        onProfilePressed: () => controller.selectedBottomNavIndex.value = 4,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.045,
          vertical: size.height * 0.015,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Child Selector
            Obx(() {
              if (controller.children.isEmpty) return const SizedBox.shrink();
              return SizedBox(
                height: (size.height * 0.05).clamp(40.0, 48.0),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.children.length,
                  separatorBuilder: (_, __) => SizedBox(width: size.width * 0.025),
                  itemBuilder: (context, index) {
                    final child = controller.children[index];
                    final isSelected = controller.selectedChild.value?.id == child.id;
                    return ChoiceChip(
                      avatar: CircleAvatar(
                        backgroundColor: isSelected ? AppColors.warmGold : AppColors.teal,
                        child: Text(
                          child.name[0],
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      label: Text(
                        '${child.name} (${child.className})',
                        style: TextStyle(
                          color: isSelected ? Colors.white : theme.colorScheme.onSurface,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          fontSize: (size.width * 0.034).clamp(12.0, 14.0),
                        ),
                      ),
                      selected: isSelected,
                      selectedColor: AppColors.deepForest,
                      backgroundColor: theme.cardColor,
                      onSelected: (_) => controller.selectChild(child),
                    );
                  },
                ),
              );
            }),
            SizedBox(height: size.height * 0.02),

            // Hero Transport Card
            HeroTransportCard(
              vanNumber: 'VAN-02',
              driverName: 'Ahmed Hassan',
              status: 'ON ROUTE',
              eta: '8 min',
              onTrackPressed: () => controller.selectedBottomNavIndex.value = 1,
            ),

            SizedBox(height: size.height * 0.03),

            // Today's Journey Section
            Text(
              "Today's Transport Journey",
              style: TextStyle(
                fontSize: (size.width * 0.045).clamp(16.0, 19.0),
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            SizedBox(height: size.height * 0.015),

            Card(
              child: Padding(
                padding: EdgeInsets.all(size.width * 0.04),
                child: Column(
                  children: [
                    _buildJourneyTimelineItem(
                      context,
                      title: 'Morning Pickup',
                      time: '07:32 AM',
                      status: 'Picked Up',
                      isCompleted: true,
                    ),
                    const Divider(height: 24),
                    _buildJourneyTimelineItem(
                      context,
                      title: 'School Arrival',
                      time: '07:58 AM',
                      status: 'Reached School',
                      isCompleted: true,
                    ),
                    const Divider(height: 24),
                    _buildJourneyTimelineItem(
                      context,
                      title: 'Return Pickup',
                      time: '01:30 PM (Expected)',
                      status: 'Pending',
                      isCompleted: false,
                    ),
                    const Divider(height: 24),
                    _buildJourneyTimelineItem(
                      context,
                      title: 'Home Drop',
                      time: '02:10 PM (Expected)',
                      status: 'Pending',
                      isCompleted: false,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: size.height * 0.03),

            // Quick Actions Grid
            Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: (size.width * 0.045).clamp(16.0, 19.0),
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            SizedBox(height: size.height * 0.015),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: size.width * 0.03,
              mainAxisSpacing: size.height * 0.015,
              childAspectRatio: 1.45,
              children: [
                _buildQuickActionCard(
                  context,
                  title: 'Attendance',
                  subtitle: '92% This Month',
                  icon: Icons.calendar_month,
                  color: AppColors.teal,
                  onTap: () => controller.selectedBottomNavIndex.value = 2,
                ),
                _buildQuickActionCard(
                  context,
                  title: 'Monthly Fee',
                  subtitle: 'Rs. 3,500 (Due)',
                  icon: Icons.account_balance_wallet,
                  color: AppColors.warmGold,
                  onTap: () => controller.selectedBottomNavIndex.value = 3,
                ),
                _buildQuickActionCard(
                  context,
                  title: 'Apply Leave',
                  subtitle: 'Submit Request',
                  icon: Icons.event_busy,
                  color: Colors.purple.shade700,
                  onTap: () => Get.to(() => const ParentLeaveView()),
                ),
                _buildQuickActionCard(
                  context,
                  title: 'Student QR Card',
                  subtitle: 'Digital ID Card',
                  icon: Icons.qr_code_2_rounded,
                  color: AppColors.deepForest,
                  onTap: () => _showStudentQrDialog(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJourneyTimelineItem(
    BuildContext context, {
    required String title,
    required String time,
    required String status,
    required bool isCompleted,
  }) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(
          isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
          color: isCompleted ? AppColors.success : Colors.grey,
          size: 22,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(
                time,
                style: TextStyle(
                  fontSize: 12,
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: isCompleted ? AppColors.success.withOpacity(0.12) : Colors.grey.withOpacity(0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            status,
            style: TextStyle(
              color: isCompleted ? AppColors.success : Colors.grey.shade700,
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActionCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.035),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 22),
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 11,
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showStudentQrDialog(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.06),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Digital Transport Student ID',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 4),
              const Text(
                'Ali Ahmad • STU-101',
                style: TextStyle(color: AppColors.teal, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.lightBorder),
                ),
                child: Column(
                  children: [
                    Icon(Icons.qr_code_2_rounded, size: size.width * 0.45, color: Colors.black),
                    const SizedBox(height: 8),
                    const Text(
                      'Token: QR-ALI-101',
                      style: TextStyle(fontSize: 11, color: Colors.grey, letterSpacing: 1),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Get.back(),
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

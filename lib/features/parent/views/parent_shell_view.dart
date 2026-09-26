import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/widgets/custom_bottom_nav.dart';
import '../viewmodels/parent_viewmodel.dart';
import 'parent_dashboard_view.dart';
import 'parent_tracking_view.dart';
import 'parent_attendance_view.dart';
import 'parent_payments_view.dart';
import 'parent_profile_view.dart';

class ParentShellView extends GetView<ParentViewModel> {
  const ParentShellView({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      const ParentDashboardView(),
      const ParentTrackingView(),
      const ParentAttendanceView(),
      const ParentPaymentsView(),
      const ParentProfileView(),
    ];

    return Scaffold(
      body: Obx(() => IndexedStack(
        index: controller.selectedBottomNavIndex.value,
        children: pages,
      )),
      bottomNavigationBar: Obx(
        () => CustomBottomNav(
          selectedIndex: controller.selectedBottomNavIndex.value,
          onTabChange: (index) => controller.selectedBottomNavIndex.value = index,
          items: [
            CustomBottomNavItem(icon: Icons.home_rounded, text: 'Home'),
            CustomBottomNavItem(icon: Icons.my_location_rounded, text: 'Track'),
            CustomBottomNavItem(icon: Icons.calendar_month_rounded, text: 'Attendance'),
            CustomBottomNavItem(icon: Icons.payments_rounded, text: 'Payments'),
            CustomBottomNavItem(icon: Icons.person_rounded, text: 'Profile'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/widgets/custom_bottom_nav.dart';
import '../viewmodels/student_viewmodel.dart';
import 'student_dashboard_view.dart';
import 'student_qr_view.dart';
import '../../parent/views/parent_tracking_view.dart';
import '../../parent/views/parent_attendance_view.dart';
import '../../parent/views/parent_profile_view.dart';

class StudentShellView extends GetView<StudentViewModel> {
  const StudentShellView({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      const StudentDashboardView(),
      const ParentTrackingView(),
      const ParentAttendanceView(),
      const StudentQrView(),
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
            CustomBottomNavItem(icon: Icons.qr_code_2_rounded, text: 'QR Card'),
            CustomBottomNavItem(icon: Icons.person_rounded, text: 'Profile'),
          ],
        ),
      ),
    );
  }
}

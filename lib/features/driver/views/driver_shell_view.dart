// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../shared/widgets/custom_bottom_nav.dart';
// import '../viewmodels/driver_viewmodel.dart';
// import 'driver_dashboard_view.dart';
// import 'driver_scanner_view.dart';
// import 'manual_attendance_view.dart';
// import '../../parent/views/parent_tracking_view.dart';
// import '../../parent/views/parent_profile_view.dart';
//
// class DriverShellView extends GetView<DriverViewModel> {
//   const DriverShellView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final pages = [
//       const DriverDashboardView(),
//       const ParentTrackingView(),
//       const DriverScannerView(),
//       const ManualAttendanceView(),
//       const ParentProfileView(),
//     ];
//
//     return Scaffold(
//       body: Obx(() => IndexedStack(
//         index: controller.selectedBottomNavIndex.value,
//         children: pages,
//       )),
//       bottomNavigationBar: Obx(
//         () => CustomBottomNav(
//           selectedIndex: controller.selectedBottomNavIndex.value,
//           onTabChange: (index) => controller.selectedBottomNavIndex.value = index,
//           items: [
//             CustomBottomNavItem(icon: Icons.dashboard_rounded, text: 'Home'),
//             CustomBottomNavItem(icon: Icons.navigation_rounded, text: 'Route'),
//             CustomBottomNavItem(icon: Icons.qr_code_scanner_rounded, text: 'Scan'),
//             CustomBottomNavItem(icon: Icons.groups_rounded, text: 'Students'),
//             CustomBottomNavItem(icon: Icons.person_rounded, text: 'Profile'),
//           ],
//         ),
//       ),
//     );
//   }
// }

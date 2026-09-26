// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../shared/widgets/custom_bottom_nav.dart';
// import '../viewmodels/admin_viewmodel.dart';
// import 'admin_dashboard_view.dart';
// import 'fleet_management_view.dart';
// import 'temporary_assignment_view.dart';
// import 'reports_view.dart';
// import 'device_management_view.dart';
//
// class AdminShellView extends GetView<AdminViewModel> {
//   const AdminShellView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final pages = [
//       const AdminDashboardView(),
//       const FleetManagementView(),
//       const TemporaryAssignmentView(),
//       const ReportsView(),
//       const DeviceManagementView(),
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
//             CustomBottomNavItem(icon: Icons.directions_bus_rounded, text: 'Fleet'),
//             CustomBottomNavItem(icon: Icons.swap_horiz_rounded, text: 'Transfers'),
//             CustomBottomNavItem(icon: Icons.bar_chart_rounded, text: 'Reports'),
//             CustomBottomNavItem(icon: Icons.phonelink_setup_rounded, text: 'Devices'),
//           ],
//         ),
//       ),
//     );
//   }
// }

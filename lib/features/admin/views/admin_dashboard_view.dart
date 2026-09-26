// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:get/get.dart';
// import '../../../core/constants/app_colors.dart';
// import '../../../shared/widgets/app_cards.dart';
// import '../viewmodels/admin_viewmodel.dart';
// import 'route_builder_view.dart';
//
// class AdminDashboardView extends GetView<AdminViewModel> {
//   const AdminDashboardView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final size = MediaQuery.sizeOf(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Admin Management Console'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.alt_route_rounded),
//             onPressed: () => Get.to(() => const RouteBuilderView()),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(size.width * 0.045),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // KPI Stat Grid
//             Obx(
//               () => GridView.count(
//                 crossAxisCount: 2,
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 crossAxisSpacing: size.width * 0.03,
//                 mainAxisSpacing: size.height * 0.015,
//                 childAspectRatio: 1.5,
//                 children: [
//                   StatCard(
//                     title: 'Total Students',
//                     value: '${controller.totalStudents.value}',
//                     icon: Icons.school,
//                     iconColor: AppColors.teal,
//                   ),
//                   StatCard(
//                     title: 'Active Vans',
//                     value: '${controller.activeVans.value}',
//                     icon: Icons.directions_bus,
//                     iconColor: AppColors.deepForest,
//                   ),
//                   StatCard(
//                     title: 'Present Today',
//                     value: '${controller.presentToday.value}',
//                     icon: Icons.check_circle,
//                     iconColor: AppColors.success,
//                   ),
//                   StatCard(
//                     title: 'Pending Fees',
//                     value: 'Rs. 45k',
//                     icon: Icons.account_balance_wallet,
//                     iconColor: AppColors.warmGold,
//                   ),
//                 ],
//               ),
//             ),
//
//             SizedBox(height: size.height * 0.03),
//
//             // Attendance Analytical Chart Section
//             Text(
//               'Weekly Attendance Trend',
//               style: TextStyle(
//                 fontSize: (size.width * 0.045).clamp(16.0, 19.0),
//                 fontWeight: FontWeight.bold,
//                 color: theme.colorScheme.onSurface,
//               ),
//             ),
//             SizedBox(height: size.height * 0.015),
//
//             Card(
//               child: Padding(
//                 padding: EdgeInsets.all(size.width * 0.045),
//                 child: SizedBox(
//                   height: size.height * 0.22,
//                   child: BarChart(
//                     BarChartData(
//                       borderData: FlBorderData(show: false),
//                       titlesData: const FlTitlesData(
//                         topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//                         rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//                       ),
//                       barGroups: [
//                         BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 310, color: AppColors.teal, width: 14)]),
//                         BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 318, color: AppColors.teal, width: 14)]),
//                         BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 305, color: AppColors.teal, width: 14)]),
//                         BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 312, color: AppColors.teal, width: 14)]),
//                         BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 320, color: AppColors.deepForest, width: 14)]),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//             SizedBox(height: size.height * 0.03),
//
//             // Quick Actions & Management Shortcuts
//             ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size(double.infinity, 48),
//                 backgroundColor: AppColors.deepForest,
//               ),
//               onPressed: () => Get.to(() => const RouteBuilderView()),
//               icon: const Icon(Icons.route_rounded),
//               label: const Text('OPEN GOOGLE MAPS ROUTE BUILDER'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

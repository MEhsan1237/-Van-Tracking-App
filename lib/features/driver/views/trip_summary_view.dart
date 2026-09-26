// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../core/constants/app_colors.dart';
// import '../viewmodels/driver_viewmodel.dart';
//
// class TripSummaryView extends GetView<DriverViewModel> {
//   const TripSummaryView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final size = MediaQuery.sizeOf(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Trip Completion Summary'),
//         automaticallyImplyLeading: false,
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(size.width * 0.06),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(20),
//                 decoration: const BoxDecoration(
//                   color: AppColors.success,
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Icon(Icons.check_rounded, color: Colors.white, size: 50),
//               ),
//               SizedBox(height: size.height * 0.02),
//               const Text(
//                 'Trip Completed Safely!',
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//               const Text(
//                 'VAN-02 • Morning Route to APS',
//                 style: TextStyle(color: Colors.grey, fontSize: 13),
//               ),
//               SizedBox(height: size.height * 0.04),
//
//               Card(
//                 child: Padding(
//                   padding: EdgeInsets.all(size.width * 0.05),
//                   child: Column(
//                     children: [
//                       _buildSummaryRow('Total Assigned', '28'),
//                       const Divider(height: 20),
//                       _buildSummaryRow('Total Boarded', '${controller.onboardCount.value}'),
//                       const Divider(height: 20),
//                       _buildSummaryRow('Total Dropped', '${controller.droppedCount.value}'),
//                       const Divider(height: 20),
//                       _buildSummaryRow('Absentees', '2'),
//                       const Divider(height: 20),
//                       _buildSummaryRow('Approved Leave', '1'),
//                       const Divider(height: 20),
//                       _buildSummaryRow('Still Onboard', '${controller.onboardCount.value}', color: AppColors.success),
//                     ],
//                   ),
//                 ),
//               ),
//
//               SizedBox(height: size.height * 0.02),
//
//               Card(
//                 color: AppColors.teal.withOpacity(0.1),
//                 child: Padding(
//                   padding: EdgeInsets.all(size.width * 0.04),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Column(
//                         children: [
//                           Text('DISTANCE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: theme.colorScheme.onSurface.withOpacity(0.6))),
//                           const Text('18.2 km', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.deepForest)),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Text('DURATION', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: theme.colorScheme.onSurface.withOpacity(0.6))),
//                           const Text('52 min', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.deepForest)),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//               SizedBox(height: size.height * 0.04),
//
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: const Size(double.infinity, 50),
//                   backgroundColor: AppColors.deepForest,
//                 ),
//                 onPressed: () => Get.offAllNamed('/driver/shell'),
//                 child: const Text('RETURN TO DRIVER DASHBOARD'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSummaryRow(String label, String value, {Color? color}) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
//         Text(
//           value,
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: color),
//         ),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../core/constants/app_colors.dart';
//
// class RouteBuilderView extends StatelessWidget {
//   const RouteBuilderView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final size = MediaQuery.sizeOf(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Google Maps Route Builder'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.save),
//             onPressed: () {
//               Get.snackbar('Route Saved', 'VAN-02 route configuration saved successfully.');
//             },
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           // Map View Overlay
//           Container(
//             color: theme.brightness == Brightness.dark ? const Color(0xFF1E2825) : const Color(0xFFE5ECE9),
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(Icons.alt_route, size: 60, color: AppColors.teal),
//                   const SizedBox(height: 12),
//                   Text(
//                     'Interactive Stop Sequence Configurator',
//                     style: TextStyle(fontWeight: FontWeight.bold, color: theme.colorScheme.onSurface),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//           // Numbered Route Stops List Overlay at Bottom
//           Positioned(
//             bottom: 20,
//             left: size.width * 0.04,
//             right: size.width * 0.04,
//             child: Card(
//               elevation: 6,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//               child: Padding(
//                 padding: EdgeInsets.all(size.width * 0.04),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text('VAN-02 Morning Route', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                         IconButton(
//                           icon: const Icon(Icons.add_location_alt, color: AppColors.teal),
//                           onPressed: () {
//                             Get.snackbar('Add Stop', 'Tap map to drop a new numbered stop marker.');
//                           },
//                         ),
//                       ],
//                     ),
//                     const Divider(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         _buildStopMarkerChip('1', 'Liberty Chowk'),
//                         _buildStopMarkerChip('2', 'Main Market'),
//                         _buildStopMarkerChip('3', 'Garden Town'),
//                         _buildStopMarkerChip('S', 'School', color: AppColors.warmGold),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildStopMarkerChip(String number, String name, {Color color = AppColors.teal}) {
//     return Column(
//       children: [
//         CircleAvatar(
//           radius: 14,
//           backgroundColor: color,
//           child: Text(number, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
//         ),
//         const SizedBox(height: 4),
//         Text(name, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
//       ],
//     );
//   }
// }

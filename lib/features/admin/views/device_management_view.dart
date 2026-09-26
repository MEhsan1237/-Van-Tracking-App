// import 'package:flutter/material.dart';
// import '../../../core/constants/app_colors.dart';
// import '../../../shared/widgets/app_status_chip.dart';
//
// class DeviceManagementView extends StatelessWidget {
//   const DeviceManagementView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final size = MediaQuery.sizeOf(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Driver Device & Scanner Logs'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(size.width * 0.045),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Registered Driver Scanners',
//               style: TextStyle(
//                 fontSize: (size.width * 0.045).clamp(16.0, 19.0),
//                 fontWeight: FontWeight.bold,
//                 color: theme.colorScheme.onSurface,
//               ),
//             ),
//             SizedBox(height: size.height * 0.015),
//
//             Card(
//               child: ListTile(
//                 leading: const CircleAvatar(
//                   backgroundColor: AppColors.teal,
//                   child: Icon(Icons.smartphone, color: Colors.white),
//                 ),
//                 title: const Text('Samsung Galaxy Tab A8 (DEV-01)', style: TextStyle(fontWeight: FontWeight.bold)),
//                 subtitle: const Text('Assigned to: VAN-02 • Ahmed Hassan'),
//                 trailing: const AppStatusChip(status: 'ONLINE'),
//               ),
//             ),
//             SizedBox(height: size.height * 0.01),
//             Card(
//               child: ListTile(
//                 leading: const CircleAvatar(
//                   backgroundColor: AppColors.teal,
//                   child: Icon(Icons.smartphone, color: Colors.white),
//                 ),
//                 title: const Text('Redmi Note 12 (DEV-02)', style: TextStyle(fontWeight: FontWeight.bold)),
//                 subtitle: const Text('Assigned to: VAN-01 • Bilal Khan'),
//                 trailing: const AppStatusChip(status: 'ONLINE'),
//               ),
//             ),
//
//             SizedBox(height: size.height * 0.03),
//
//             Text(
//               'Live Scanner Audit Logs',
//               style: TextStyle(
//                 fontSize: (size.width * 0.045).clamp(16.0, 19.0),
//                 fontWeight: FontWeight.bold,
//                 color: theme.colorScheme.onSurface,
//               ),
//             ),
//             SizedBox(height: size.height * 0.015),
//
//             Card(
//               child: Column(
//                 children: const [
//                   ListTile(
//                     leading: Icon(Icons.check_circle, color: AppColors.success),
//                     title: Text('QR-ALI-101 Scanned • Authorized'),
//                     subtitle: Text('07:34 AM • DEV-01 • VAN-02 Boarding Recorded'),
//                   ),
//                   Divider(height: 1),
//                   ListTile(
//                     leading: Icon(Icons.check_circle, color: AppColors.success),
//                     title: Text('QR-ZARA-102 Scanned • Authorized'),
//                     subtitle: Text('07:36 AM • DEV-01 • VAN-02 Boarding Recorded'),
//                   ),
//                   Divider(height: 1),
//                   ListTile(
//                     leading: Icon(Icons.warning, color: AppColors.warning),
//                     title: Text('Manual Override Verification'),
//                     subtitle: Text('07:40 AM • DEV-01 • Card Forgotten override by Ahmed'),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../core/constants/app_colors.dart';
//
// class ReportsView extends StatelessWidget {
//   const ReportsView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final size = MediaQuery.sizeOf(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Analytics & Export Reports'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(size.width * 0.045),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Exportable Operational Reports',
//               style: TextStyle(
//                 fontSize: (size.width * 0.045).clamp(16.0, 19.0),
//                 fontWeight: FontWeight.bold,
//                 color: theme.colorScheme.onSurface,
//               ),
//             ),
//             SizedBox(height: size.height * 0.015),
//
//             _buildReportCard(
//               context,
//               title: 'Monthly Student Attendance Report',
//               subtitle: 'Comprehensive monthly attendance & boarding breakdown',
//               icon: Icons.school,
//             ),
//             SizedBox(height: size.height * 0.01),
//             _buildReportCard(
//               context,
//               title: 'Fee Collection & Audit Report',
//               subtitle: 'Paid, pending, and overdue transport fee ledgers',
//               icon: Icons.payments,
//             ),
//             SizedBox(height: size.height * 0.01),
//             _buildReportCard(
//               context,
//               title: 'Fleet & Driver Performance Report',
//               subtitle: 'Trip durations, fuel logs, and GPS tracking history',
//               icon: Icons.directions_bus,
//             ),
//             SizedBox(height: size.height * 0.01),
//             _buildReportCard(
//               context,
//               title: 'Scanner Audit & Transfer Logs',
//               subtitle: 'QR verification logs and temporary van overrides',
//               icon: Icons.qr_code_scanner,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildReportCard(
//     BuildContext context, {
//     required String title,
//     required String subtitle,
//     required IconData icon,
//   }) {
//     return Card(
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundColor: AppColors.teal.withOpacity(0.12),
//           child: Icon(icon, color: AppColors.teal),
//         ),
//         title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//         subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
//         trailing: PopupMenuButton<String>(
//           onSelected: (val) {
//             Get.snackbar('Exporting Report', 'Generating $val file for $title...');
//           },
//           itemBuilder: (_) => const [
//             PopupMenuItem(value: 'PDF', child: Text('Export PDF')),
//             PopupMenuItem(value: 'CSV', child: Text('Export CSV')),
//           ],
//         ),
//       ),
//     );
//   }
// }

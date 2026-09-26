// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../core/constants/app_colors.dart';
// import '../../../data/models/student_model.dart';
// import '../../../shared/widgets/app_status_chip.dart';
// import '../viewmodels/driver_viewmodel.dart';
//
// class ManualAttendanceView extends GetView<DriverViewModel> {
//   const ManualAttendanceView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final size = MediaQuery.sizeOf(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Manual Verification & List'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(size.width * 0.045),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Assigned Students for VAN-02',
//               style: TextStyle(
//                 fontSize: (size.width * 0.045).clamp(16.0, 19.0),
//                 fontWeight: FontWeight.bold,
//                 color: theme.colorScheme.onSurface,
//               ),
//             ),
//             SizedBox(height: size.height * 0.015),
//
//             Obx(
//               () => ListView.separated(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: controller.assignedStudents.length,
//                 separatorBuilder: (_, __) => SizedBox(height: size.height * 0.01),
//                 itemBuilder: (context, index) {
//                   final student = controller.assignedStudents[index];
//                   return Card(
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         backgroundColor: AppColors.teal,
//                         child: Text(student.name[0], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//                       ),
//                       title: Text(student.name, style: const TextStyle(fontWeight: FontWeight.bold)),
//                       subtitle: Text('${student.studentCode} • ${student.pickupPoint}'),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           AppStatusChip(status: student.status.toUpperCase()),
//                           IconButton(
//                             icon: const Icon(Icons.edit_note, color: AppColors.teal),
//                             onPressed: () => _showManualVerificationDialog(context, student),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _showManualVerificationDialog(BuildContext context, StudentModel student) {
//     String selectedReason = 'Card Forgotten';
//     Get.dialog(
//       Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text('Manual Attendance Verification', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//               const SizedBox(height: 8),
//               Text('${student.name} (${student.studentCode})', style: const TextStyle(color: AppColors.teal, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 16),
//               const Text('Select Override Reason:', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
//               const SizedBox(height: 8),
//               DropdownButtonFormField<String>(
//                 value: selectedReason,
//                 items: const [
//                   DropdownMenuItem(value: 'Card Forgotten', child: Text('Card Forgotten')),
//                   DropdownMenuItem(value: 'Card Damaged', child: Text('Card Damaged')),
//                   DropdownMenuItem(value: 'Camera Issue', child: Text('Camera Issue')),
//                   DropdownMenuItem(value: 'Device Issue', child: Text('Device Issue')),
//                 ],
//                 onChanged: (val) {
//                   if (val != null) selectedReason = val;
//                 },
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: const Size(double.infinity, 46),
//                   backgroundColor: AppColors.deepForest,
//                 ),
//                 onPressed: () {
//                   controller.processQrCode(student.qrToken);
//                   Get.back();
//                 },
//                 child: const Text('Confirm Manual Verification'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

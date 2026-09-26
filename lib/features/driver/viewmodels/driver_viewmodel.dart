// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../data/models/vehicle_model.dart';
// import '../../../data/models/student_model.dart';
// import '../../../core/enums/app_enums.dart';
//
// class DriverViewModel extends GetxController {
//   final RxInt selectedBottomNavIndex = 0.obs;
//
//   final Rx<VehicleModel?> assignedVan = Rx<VehicleModel?>(null);
//   final RxList<StudentModel> assignedStudents = <StudentModel>[].obs;
//   final Rx<TripStatus> tripStatus = TripStatus.scheduled.obs;
//
//   final RxInt totalAssigned = 28.obs;
//   final RxInt onboardCount = 0.obs;
//   final RxInt droppedCount = 0.obs;
//   final RxInt capacity = 30.obs;
//
//   final Rx<ScannerState> scannerState = ScannerState.ready.obs;
//   final RxString scanFeedbackMessage = ''.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     loadDriverData();
//   }
//
//   void loadDriverData() {
//     assignedVan.value = VehicleModel(
//       id: 'V02',
//       vanNumber: 'VAN-02',
//       registrationPlate: 'LEA-4589',
//       capacity: 30,
//       assignedCount: 28,
//       onboardCount: 0,
//       driverId: 'D01',
//       driverName: 'Ahmed Hassan',
//       driverPhone: '+92 321 9876543',
//       routeName: 'Gulberg to APS Route',
//       currentLat: 31.5204,
//       currentLng: 74.3587,
//       lastLocationUpdate: DateTime.now(),
//     );
//
//     assignedStudents.value = [
//       StudentModel(
//         id: 'S101',
//         studentCode: 'STU-101',
//         name: 'Ali Ahmad',
//         className: 'Grade 5-B',
//         parentId: 'P01',
//         parentName: 'Muhammad Ehsan',
//         parentPhone: '+92 300 1234567',
//         permanentVanId: 'V02',
//         permanentVanNumber: 'VAN-02',
//         pickupPoint: 'Stop 3 - Garden Town',
//         dropPoint: 'Army Public School',
//         qrToken: 'QR-ALI-101',
//         status: 'Waiting',
//       ),
//       StudentModel(
//         id: 'S102',
//         studentCode: 'STU-102',
//         name: 'Zara Ahmad',
//         className: 'Grade 3-A',
//         parentId: 'P01',
//         parentName: 'Muhammad Ehsan',
//         parentPhone: '+92 300 1234567',
//         permanentVanId: 'V02',
//         permanentVanNumber: 'VAN-02',
//         pickupPoint: 'Stop 3 - Garden Town',
//         dropPoint: 'Army Public School',
//         qrToken: 'QR-ZARA-102',
//         status: 'Waiting',
//       ),
//     ];
//   }
//
//   void startTrip() {
//     tripStatus.value = TripStatus.inProgress;
//     Get.snackbar(
//       'Trip Started',
//       'Location tracking active for VAN-02 route.',
//       backgroundColor: Colors.green.shade800,
//       colorText: Colors.white,
//     );
//   }
//
//   void processQrCode(String qrToken) {
//     if (tripStatus.value != TripStatus.inProgress) {
//       Get.snackbar('Error', 'Please start the trip before scanning student QR codes.');
//       return;
//     }
//
//     final studentIndex = assignedStudents.indexWhere((s) => s.qrToken == qrToken);
//     if (studentIndex != -1) {
//       final student = assignedStudents[studentIndex];
//       if (student.status == 'Onboard') {
//         // Drop confirmation
//         assignedStudents[studentIndex] = StudentModel(
//           id: student.id,
//           studentCode: student.studentCode,
//           name: student.name,
//           className: student.className,
//           parentId: student.parentId,
//           parentName: student.parentName,
//           parentPhone: student.parentPhone,
//           permanentVanId: student.permanentVanId,
//           permanentVanNumber: student.permanentVanNumber,
//           pickupPoint: student.pickupPoint,
//           dropPoint: student.dropPoint,
//           qrToken: student.qrToken,
//           status: 'Dropped',
//         );
//         onboardCount.value--;
//         droppedCount.value++;
//         Get.snackbar(
//           '✓ DROPPED AT SCHOOL',
//           '${student.name} (${student.studentCode}) dropped safely.',
//           backgroundColor: Colors.blue.shade800,
//           colorText: Colors.white,
//         );
//       } else {
//         // Boarding confirmation
//         if (onboardCount.value >= capacity.value) {
//           Get.snackbar(
//             '✕ CAPACITY EXCEEDED',
//             'Van is at maximum safe capacity (${capacity.value}/${capacity.value}).',
//             backgroundColor: Colors.red.shade800,
//             colorText: Colors.white,
//           );
//           return;
//         }
//
//         assignedStudents[studentIndex] = StudentModel(
//           id: student.id,
//           studentCode: student.studentCode,
//           name: student.name,
//           className: student.className,
//           parentId: student.parentId,
//           parentName: student.parentName,
//           parentPhone: student.parentPhone,
//           permanentVanId: student.permanentVanId,
//           permanentVanNumber: student.permanentVanNumber,
//           pickupPoint: student.pickupPoint,
//           dropPoint: student.dropPoint,
//           qrToken: student.qrToken,
//           status: 'Onboard',
//         );
//         onboardCount.value++;
//         Get.snackbar(
//           '✓ BOARDING ALLOWED',
//           '${student.name} (${student.studentCode})\nBoarded VAN-02 • Onboard: ${onboardCount.value}',
//           backgroundColor: Colors.green.shade800,
//           colorText: Colors.white,
//         );
//       }
//       assignedStudents.refresh();
//     } else {
//       Get.snackbar(
//         '✕ NOT AUTHORIZED',
//         'Scanned QR token is not assigned to VAN-02 for this trip.',
//         backgroundColor: Colors.red.shade800,
//         colorText: Colors.white,
//       );
//     }
//   }
//
//   void endTrip() {
//     if (onboardCount.value > 0) {
//       Get.dialog(
//         AlertDialog(
//           title: const Row(
//             children: [
//               Icon(Icons.warning, color: Colors.orange),
//               SizedBox(width: 8),
//               Text('STUDENTS STILL ONBOARD'),
//             ],
//           ),
//           content: Text('${onboardCount.value} student(s) are still marked onboard. Cannot end trip until all students are dropped.'),
//           actions: [
//             TextButton(
//               onPressed: () => Get.back(),
//               child: const Text('OK'),
//             ),
//           ],
//         ),
//       );
//       return;
//     }
//
//     tripStatus.value = TripStatus.completed;
//     Get.offNamed('/driver/trip-summary');
//   }
// }

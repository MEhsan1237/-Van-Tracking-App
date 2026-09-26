import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/vehicle_model.dart';
import '../../../data/models/temporary_assignment_model.dart';

class AdminViewModel extends GetxController {
  final RxInt selectedBottomNavIndex = 0.obs;

  final RxInt totalStudents = 350.obs;
  final RxInt activeVans = 12.obs;
  final RxInt totalDrivers = 12.obs;
  final RxInt presentToday = 312.obs;
  final RxInt absenteesCount = 24.obs;
  final RxInt leaveCount = 14.obs;
  final RxInt activeTripsCount = 8.obs;
  final RxDouble pendingFeesAmount = 45000.0.obs;
  final RxInt pendingLeaveRequests = 5.obs;

  final RxList<VehicleModel> fleetList = <VehicleModel>[].obs;
  final RxList<TemporaryAssignmentModel> tempAssignments = <TemporaryAssignmentModel>[].obs;

  final tempStudentIdController = TextEditingController();
  final tempReasonController = TextEditingController();
  final RxString selectedOriginalVan = 'VAN-01'.obs;
  final RxString selectedTargetVan = 'VAN-02'.obs;

  @override
  void onInit() {
    super.onInit();
    loadAdminData();
  }

  void loadAdminData() {
    fleetList.value = [
      VehicleModel(
        id: 'V01',
        vanNumber: 'VAN-01',
        registrationPlate: 'LEA-1234',
        capacity: 30,
        assignedCount: 30, // FULL
        onboardCount: 28,
        driverId: 'D02',
        driverName: 'Bilal Khan',
        driverPhone: '+92 300 7654321',
        routeName: 'Model Town Route',
      ),
      VehicleModel(
        id: 'V02',
        vanNumber: 'VAN-02',
        registrationPlate: 'LEA-4589',
        capacity: 30,
        assignedCount: 28, // 2 Seats available
        onboardCount: 21,
        driverId: 'D01',
        driverName: 'Ahmed Hassan',
        driverPhone: '+92 321 9876543',
        routeName: 'Gulberg Route',
      ),
    ];

    tempAssignments.value = [
      TemporaryAssignmentModel(
        id: 'TA01',
        studentId: 'S101',
        studentName: 'Ali Ahmad',
        originalVanId: 'V01',
        temporaryVanId: 'V02',
        validFrom: DateTime.now(),
        validUntil: DateTime.now().add(const Duration(days: 1)),
        tripType: 'Morning',
        reason: 'Original VAN-01 under maintenance',
        status: 'Approved',
        createdBy: 'Admin',
      ),
    ];
  }

  void approveTemporaryAssignment() {
    // Check target vehicle capacity
    final targetVan = fleetList.firstWhereOrNull((v) => v.vanNumber == selectedTargetVan.value);
    if (targetVan != null) {
      if (targetVan.availableCapacity <= 0) {
        Get.dialog(
          AlertDialog(
            title: const Row(
              children: [
                Icon(Icons.warning_amber_rounded, color: Colors.orange),
                SizedBox(width: 8),
                Text('Capacity Exceeded'),
              ],
            ),
            content: Text('${targetVan.vanNumber} is at maximum capacity (${targetVan.capacity}/${targetVan.capacity}). Cannot assign more students.'),
            actions: [
              TextButton(onPressed: () => Get.back(), child: const Text('OK')),
            ],
          ),
        );
        return;
      }
    }

    final newAssignment = TemporaryAssignmentModel(
      id: 'TA${DateTime.now().millisecondsSinceEpoch}',
      studentId: tempStudentIdController.text.trim().isEmpty ? 'S105' : tempStudentIdController.text.trim(),
      studentName: 'Usman Tariq',
      originalVanId: selectedOriginalVan.value,
      temporaryVanId: selectedTargetVan.value,
      validFrom: DateTime.now(),
      validUntil: DateTime.now().add(const Duration(days: 1)),
      tripType: 'Morning',
      reason: tempReasonController.text.trim().isEmpty ? 'Van Maintenance' : tempReasonController.text.trim(),
      status: 'Approved',
      createdBy: 'Admin',
    );

    tempAssignments.insert(0, newAssignment);
    Get.back();
    Get.snackbar(
      'Assignment Approved',
      'Temporary transfer to ${selectedTargetVan.value} authorized.',
      backgroundColor: Colors.green.shade800,
      colorText: Colors.white,
    );
  }

  @override
  void onClose() {
    tempStudentIdController.dispose();
    tempReasonController.dispose();
    super.onClose();
  }
}

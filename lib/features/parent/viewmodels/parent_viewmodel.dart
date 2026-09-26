import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/student_model.dart';
import '../../../data/models/vehicle_model.dart';
import '../../../data/models/fee_model.dart';
import '../../../data/models/leave_request_model.dart';
import '../../../core/enums/app_enums.dart';

class ParentViewModel extends GetxController {
  final RxInt selectedBottomNavIndex = 0.obs;

  final RxList<StudentModel> children = <StudentModel>[].obs;
  final Rx<StudentModel?> selectedChild = Rx<StudentModel?>(null);
  final Rx<VehicleModel?> currentVan = Rx<VehicleModel?>(null);
  final RxList<FeeModel> feeHistory = <FeeModel>[].obs;
  final RxList<LeaveRequestModel> leaveRequests = <LeaveRequestModel>[].obs;

  final leaveReasonController = TextEditingController();
  final Rx<DateTime> leaveFromDate = DateTime.now().obs;
  final Rx<DateTime> leaveToDate = DateTime.now().add(const Duration(days: 1)).obs;

  @override
  void onInit() {
    super.onInit();
    loadParentData();
  }

  void loadParentData() {
    // Populate sample commercial data
    children.value = [
      StudentModel(
        id: 'S101',
        studentCode: 'STU-101',
        name: 'Ali Ahmad',
        className: 'Grade 5-B',
        parentId: 'P01',
        parentName: 'Muhammad Ehsan',
        parentPhone: '+92 300 1234567',
        permanentVanId: 'V02',
        permanentVanNumber: 'VAN-02',
        pickupPoint: 'Stop 3 - Garden Town',
        dropPoint: 'Army Public School',
        qrToken: 'QR-ALI-101',
        status: 'Onboard',
      ),
      StudentModel(
        id: 'S102',
        studentCode: 'STU-102',
        name: 'Zara Ahmad',
        className: 'Grade 3-A',
        parentId: 'P01',
        parentName: 'Muhammad Ehsan',
        parentPhone: '+92 300 1234567',
        permanentVanId: 'V02',
        permanentVanNumber: 'VAN-02',
        pickupPoint: 'Stop 3 - Garden Town',
        dropPoint: 'Army Public School',
        qrToken: 'QR-ZARA-102',
        status: 'Present',
      ),
    ];
    selectedChild.value = children.first;

    currentVan.value = VehicleModel(
      id: 'V02',
      vanNumber: 'VAN-02',
      registrationPlate: 'LEA-4589',
      capacity: 30,
      assignedCount: 28,
      onboardCount: 21,
      driverId: 'D01',
      driverName: 'Ahmed Hassan',
      driverPhone: '+92 321 9876543',
      routeName: 'Gulberg to APS Route',
      currentLat: 31.5204,
      currentLng: 74.3587,
      lastLocationUpdate: DateTime.now(),
    );

    feeHistory.value = [
      FeeModel(
        id: 'F01',
        studentId: 'S101',
        studentName: 'Ali Ahmad',
        monthYear: 'September 2026',
        amount: 3500.0,
        dueDate: DateTime.now().add(const Duration(days: 5)),
        status: FeeStatus.pending,
      ),
      FeeModel(
        id: 'F00',
        studentId: 'S101',
        studentName: 'Ali Ahmad',
        monthYear: 'August 2026',
        amount: 3500.0,
        dueDate: DateTime.now().subtract(const Duration(days: 25)),
        status: FeeStatus.paid,
        paymentMethod: 'JazzCash',
        paidAt: DateTime.now().subtract(const Duration(days: 26)),
        receiptNumber: 'REC-982341',
      ),
    ];

    leaveRequests.value = [
      LeaveRequestModel(
        id: 'L01',
        studentId: 'S101',
        studentName: 'Ali Ahmad',
        parentId: 'P01',
        fromDate: DateTime.now().add(const Duration(days: 2)),
        toDate: DateTime.now().add(const Duration(days: 3)),
        reason: 'Family event and medical appointment',
        status: LeaveStatus.approved,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ];
  }

  void selectChild(StudentModel child) {
    selectedChild.value = child;
  }

  void submitLeaveRequest() {
    if (leaveReasonController.text.trim().isEmpty) {
      Get.snackbar('Required', 'Please enter a valid reason for leave.');
      return;
    }

    final newReq = LeaveRequestModel(
      id: 'L${DateTime.now().millisecondsSinceEpoch}',
      studentId: selectedChild.value?.id ?? 'S101',
      studentName: selectedChild.value?.name ?? 'Ali Ahmad',
      parentId: 'P01',
      fromDate: leaveFromDate.value,
      toDate: leaveToDate.value,
      reason: leaveReasonController.text.trim(),
      status: LeaveStatus.pending,
      createdAt: DateTime.now(),
    );

    leaveRequests.insert(0, newReq);
    leaveReasonController.clear();
    Get.back();
    Get.snackbar(
      'Success',
      'Leave request submitted successfully for approval.',
      backgroundColor: Colors.green.shade800,
      colorText: Colors.white,
    );
  }

  void processFeePayment(FeeModel fee, String method) {
    final index = feeHistory.indexWhere((f) => f.id == fee.id);
    if (index != -1) {
      feeHistory[index] = FeeModel(
        id: fee.id,
        studentId: fee.studentId,
        studentName: fee.studentName,
        monthYear: fee.monthYear,
        amount: fee.amount,
        dueDate: fee.dueDate,
        status: FeeStatus.paid,
        paymentMethod: method,
        paidAt: DateTime.now(),
        receiptNumber: 'REC-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
      );
      feeHistory.refresh();
      Get.back();
      Get.snackbar(
        'Payment Successful',
        'Fee receipt generated via $method.',
        backgroundColor: Colors.green.shade800,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    leaveReasonController.dispose();
    super.onClose();
  }
}

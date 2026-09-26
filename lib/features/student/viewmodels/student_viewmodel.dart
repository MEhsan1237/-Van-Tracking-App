import 'package:get/get.dart';
import '../../../data/models/student_model.dart';
import '../../../data/models/vehicle_model.dart';

class StudentViewModel extends GetxController {
  final RxInt selectedBottomNavIndex = 0.obs;

  final Rx<StudentModel?> studentProfile = Rx<StudentModel?>(null);
  final Rx<VehicleModel?> assignedVan = Rx<VehicleModel?>(null);

  @override
  void onInit() {
    super.onInit();
    loadStudentData();
  }

  void loadStudentData() {
    studentProfile.value = StudentModel(
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
    );

    assignedVan.value = VehicleModel(
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
  }
}

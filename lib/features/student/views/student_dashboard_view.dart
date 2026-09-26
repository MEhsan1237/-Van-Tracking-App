import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/app_cards.dart';
import '../viewmodels/student_viewmodel.dart';

class StudentDashboardView extends GetView<StudentViewModel> {
  const StudentDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Portal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code),
            onPressed: () => controller.selectedBottomNavIndex.value = 3,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(size.width * 0.045),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Student Profile Welcome Header Card
            Container(
              padding: EdgeInsets.all(size.width * 0.045),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColors.warmGold,
                    child: Text('A', style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Ali Ahmad',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Grade 5-B • STU-101',
                        style: TextStyle(color: AppColors.softBeige, fontSize: 13),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text('Assigned: VAN-02', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.03),

            // Live Van Status Card
            HeroTransportCard(
              vanNumber: 'VAN-02',
              driverName: 'Ahmed Hassan',
              status: 'ON ROUTE',
              eta: '8 min',
              onTrackPressed: () => controller.selectedBottomNavIndex.value = 1,
            ),
            SizedBox(height: size.height * 0.03),

            // Digital QR Card Quick Access Banner
            Card(
              color: AppColors.teal.withOpacity(0.1),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: const BorderSide(color: AppColors.teal)),
              child: ListTile(
                leading: const Icon(Icons.qr_code_2, color: AppColors.teal, size: 36),
                title: const Text('Show Digital Transport ID Card', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('Tap to open scanner-ready QR Code'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.teal),
                onTap: () => controller.selectedBottomNavIndex.value = 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

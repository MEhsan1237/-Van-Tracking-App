import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/enums/app_enums.dart';
import '../viewmodels/driver_viewmodel.dart';

class DriverDashboardView extends GetView<DriverViewModel> {
  const DriverDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver Operations Console'),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            onPressed: () => controller.selectedBottomNavIndex.value = 2,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(size.width * 0.045),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Van Header Banner
            Container(
              padding: EdgeInsets.all(size.width * 0.05),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'VAN-02 (LEA-4589)',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Obx(() => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: controller.tripStatus.value == TripStatus.inProgress
                              ? AppColors.success
                              : AppColors.warmGold,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          controller.tripStatus.value.name.toUpperCase(),
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
                        ),
                      )),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text('Morning Route • Gulberg to APS', style: TextStyle(color: AppColors.softBeige, fontSize: 13)),
                  SizedBox(height: size.height * 0.02),

                  // Counters Grid
                  Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildHeaderCounter('STUDENTS', '${controller.totalAssigned.value}'),
                      _buildHeaderCounter('CAPACITY', '${controller.capacity.value}'),
                      _buildHeaderCounter('ONBOARD', '${controller.onboardCount.value}'),
                      _buildHeaderCounter('DROPPED', '${controller.droppedCount.value}'),
                    ],
                  )),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.025),

            // Start Trip / End Trip Action Button
            Obx(() {
              if (controller.tripStatus.value == TripStatus.scheduled) {
                return ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 54),
                    backgroundColor: AppColors.success,
                  ),
                  onPressed: () => controller.startTrip(),
                  icon: const Icon(Icons.play_arrow_rounded, size: 28),
                  label: const Text('START MORNING TRIP', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                );
              } else if (controller.tripStatus.value == TripStatus.inProgress) {
                return ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 54),
                    backgroundColor: AppColors.error,
                  ),
                  onPressed: () => controller.endTrip(),
                  icon: const Icon(Icons.stop_rounded, size: 28),
                  label: const Text('END TRIP & SAFETY CHECK', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                );
              } else {
                return const Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Trip Completed for Today!', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.success)),
                  ),
                );
              }
            }),

            SizedBox(height: size.height * 0.03),

            // Today's Route Stops Sequence
            Text(
              "Today's Stop Sequence",
              style: TextStyle(
                fontSize: (size.width * 0.045).clamp(16.0, 19.0),
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            SizedBox(height: size.height * 0.015),

            Card(
              child: Column(
                children: const [
                  ListTile(
                    leading: CircleAvatar(backgroundColor: AppColors.teal, child: Text('1', style: TextStyle(color: Colors.white))),
                    title: Text('Stop 1 - Liberty Chowk'),
                    subtitle: Text('07:15 AM • 8 Students Expected'),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: CircleAvatar(backgroundColor: AppColors.teal, child: Text('2', style: TextStyle(color: Colors.white))),
                    title: Text('Stop 2 - Main Market Gulberg'),
                    subtitle: Text('07:25 AM • 10 Students Expected'),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: CircleAvatar(backgroundColor: AppColors.teal, child: Text('3', style: TextStyle(color: Colors.white))),
                    title: Text('Stop 3 - Garden Town'),
                    subtitle: Text('07:35 AM • 10 Students Expected'),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: CircleAvatar(backgroundColor: AppColors.warmGold, child: Icon(Icons.school, color: Colors.white)),
                    title: Text('School - Army Public School'),
                    subtitle: Text('08:00 AM • Drop-off Destination'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCounter(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900)),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(color: AppColors.softBeige, fontSize: 10, letterSpacing: 0.5)),
      ],
    );
  }
}

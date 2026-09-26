import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/app_status_chip.dart';
import '../viewmodels/admin_viewmodel.dart';

class FleetManagementView extends GetView<AdminViewModel> {
  const FleetManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fleet & Vehicle Management'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(size.width * 0.045),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Registered Transport Vehicles',
              style: TextStyle(
                fontSize: (size.width * 0.045).clamp(16.0, 19.0),
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            SizedBox(height: size.height * 0.015),

            Obx(
              () => ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.fleetList.length,
                separatorBuilder: (_, __) => SizedBox(height: size.height * 0.01),
                itemBuilder: (context, index) {
                  final vehicle = controller.fleetList[index];
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(size.width * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${vehicle.vanNumber} (${vehicle.registrationPlate})',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              AppStatusChip(
                                status: vehicle.availableCapacity == 0 ? 'CAPACITY FULL' : 'AVAILABLE',
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text('Driver: ${vehicle.driverName} • ${vehicle.driverPhone}'),
                          const SizedBox(height: 4),
                          Text(
                            'Route: ${vehicle.routeName}',
                            style: const TextStyle(color: AppColors.teal, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Occupancy: ${vehicle.assignedCount} / ${vehicle.capacity} seats',
                                style: TextStyle(fontSize: 12, color: theme.colorScheme.onSurface.withOpacity(0.7)),
                              ),
                              Text(
                                'Available: ${vehicle.availableCapacity} seats',
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.warmGold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

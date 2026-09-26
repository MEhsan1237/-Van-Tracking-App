import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/app_status_chip.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../viewmodels/admin_viewmodel.dart';

class TemporaryAssignmentView extends GetView<AdminViewModel> {
  const TemporaryAssignmentView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Temporary Van Assignments'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () => _showNewTransferSheet(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(size.width * 0.045),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                backgroundColor: AppColors.deepForest,
              ),
              onPressed: () => _showNewTransferSheet(context),
              icon: const Icon(Icons.swap_horiz),
              label: const Text('CREATE TEMPORARY STUDENT TRANSFER'),
            ),
            SizedBox(height: size.height * 0.03),

            Text(
              'Active & Scheduled Transfers',
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
                itemCount: controller.tempAssignments.length,
                separatorBuilder: (_, __) => SizedBox(height: size.height * 0.01),
                itemBuilder: (context, index) {
                  final item = controller.tempAssignments[index];
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
                                item.studentName,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              AppStatusChip(status: item.status.toUpperCase()),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Text('Original: ${item.originalVanId}', style: const TextStyle(color: Colors.grey)),
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_forward, size: 16, color: AppColors.teal),
                              const SizedBox(width: 8),
                              Text('Temporary: ${item.temporaryVanId}', style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.teal)),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text('Reason: ${item.reason}', style: TextStyle(fontSize: 12, color: theme.colorScheme.onSurface.withOpacity(0.7))),
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

  void _showNewTransferSheet(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Create Temporary Van Transfer', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 16),
              AppTextField(
                controller: controller.tempStudentIdController,
                labelText: 'Student Code / ID',
                hintText: 'e.g. STU-105',
              ),
              const SizedBox(height: 12),
              AppTextField(
                controller: controller.tempReasonController,
                labelText: 'Transfer Reason',
                hintText: 'e.g. Van breakdown, route alteration...',
              ),
              const SizedBox(height: 16),
              const Text('Target Temporary Van:'),
              Obx(
                () => DropdownButtonFormField<String>(
                  value: controller.selectedTargetVan.value,
                  items: const [
                    DropdownMenuItem(value: 'VAN-01', child: Text('VAN-01 (Capacity 30/30 - FULL)')),
                    DropdownMenuItem(value: 'VAN-02', child: Text('VAN-02 (Capacity 28/30 - 2 Seats Available)')),
                  ],
                  onChanged: (val) {
                    if (val != null) controller.selectedTargetVan.value = val;
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 46),
                  backgroundColor: AppColors.deepForest,
                ),
                onPressed: () => controller.approveTemporaryAssignment(),
                child: const Text('Check Capacity & Authorize Transfer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

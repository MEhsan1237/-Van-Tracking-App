import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/app_status_chip.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../viewmodels/parent_viewmodel.dart';

class ParentLeaveView extends GetView<ParentViewModel> {
  const ParentLeaveView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Leave Requests'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () => _showApplyLeaveBottomSheet(context),
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
              onPressed: () => _showApplyLeaveBottomSheet(context),
              icon: const Icon(Icons.add_task),
              label: const Text('Apply New Transport Leave'),
            ),
            SizedBox(height: size.height * 0.03),

            Text(
              'Leave Application History',
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
                itemCount: controller.leaveRequests.length,
                separatorBuilder: (ctx, idx) => SizedBox(height: size.height * 0.01),
                itemBuilder: (context, index) {
                  final req = controller.leaveRequests[index];
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
                                req.studentName,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              AppStatusChip(status: req.status.name.toUpperCase()),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Duration: ${req.fromDate.day}/${req.fromDate.month} to ${req.toDate.day}/${req.toDate.month}',
                            style: const TextStyle(color: AppColors.teal, fontWeight: FontWeight.w600, fontSize: 13),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Reason: ${req.reason}',
                            style: TextStyle(fontSize: 13, color: theme.colorScheme.onSurface.withOpacity(0.75)),
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

  void _showApplyLeaveBottomSheet(BuildContext context) {
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
              const Text(
                'Apply Leave for Transport',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: controller.leaveReasonController,
                labelText: 'Reason for Leave',
                hintText: 'e.g. Sickness, Family function...',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 46),
                  backgroundColor: AppColors.deepForest,
                ),
                onPressed: () => controller.submitLeaveRequest(),
                child: const Text('Submit Leave Request'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

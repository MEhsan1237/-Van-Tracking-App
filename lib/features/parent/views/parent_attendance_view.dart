import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/app_status_chip.dart';
import '../viewmodels/parent_viewmodel.dart';

class ParentAttendanceView extends GetView<ParentViewModel> {
  const ParentAttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance History'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(size.width * 0.045),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Monthly Summary Card
            Card(
              child: Padding(
                padding: EdgeInsets.all(size.width * 0.045),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'September 2026',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.teal.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            '88.5% Present',
                            style: TextStyle(color: AppColors.teal, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildSummaryItem('Present', '23', AppColors.success),
                        _buildSummaryItem('Absent', '02', AppColors.error),
                        _buildSummaryItem('Leave', '01', AppColors.warmGold),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),

            Text(
              'Daily Transport Logs',
              style: TextStyle(
                fontSize: (size.width * 0.045).clamp(16.0, 19.0),
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            SizedBox(height: size.height * 0.015),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              separatorBuilder: (_, __) => SizedBox(height: size.height * 0.01),
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.teal.withOpacity(0.12),
                      child: const Icon(Icons.directions_bus, color: AppColors.teal, size: 20),
                    ),
                    title: Text(
                      'Friday, 26 Sep 2026',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    subtitle: const Text('Pickup: 07:32 AM • Drop: 02:10 PM'),
                    trailing: const AppStatusChip(status: 'PRESENT'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}

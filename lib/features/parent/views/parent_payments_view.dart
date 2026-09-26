import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/enums/app_enums.dart';
import '../../../data/models/fee_model.dart';
import '../../../shared/widgets/app_status_chip.dart';
import '../viewmodels/parent_viewmodel.dart';

class ParentPaymentsView extends GetView<ParentViewModel> {
  const ParentPaymentsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transport Fees & Payments'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(size.width * 0.045),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Active Fee Invoice Card
            Obx(() {
              final currentFee = controller.feeHistory.firstWhereOrNull((f) => f.status == FeeStatus.pending);
              if (currentFee == null) {
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(size.width * 0.04),
                    child: const Row(
                      children: [
                        Icon(Icons.check_circle, color: AppColors.success),
                        SizedBox(width: 12),
                        Text('All transport fee invoices are paid up to date!'),
                      ],
                    ),
                  ),
                );
              }

              return Container(
                width: double.infinity,
                padding: EdgeInsets.all(size.width * 0.05),
                decoration: BoxDecoration(
                  gradient: AppColors.accentGradient,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.warmGold.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          currentFee.monthYear,
                          style: const TextStyle(
                            color: AppColors.deepForest,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const AppStatusChip(status: 'PENDING'),
                      ],
                    ),
                    SizedBox(height: size.height * 0.015),
                    Text(
                      'Rs. ${currentFee.amount.toStringAsFixed(0)}',
                      style: const TextStyle(
                        color: AppColors.deepForest,
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Due Date: 10 Oct 2026',
                      style: TextStyle(
                        color: AppColors.deepForest.withOpacity(0.8),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.deepForest,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 46),
                      ),
                      onPressed: () => _showPaymentMethodSheet(context, currentFee),
                      child: const Text('Pay Transport Fee Now'),
                    ),
                  ],
                ),
              );
            }),

            SizedBox(height: size.height * 0.03),

            Text(
              'Payment History & Receipts',
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
                itemCount: controller.feeHistory.length,
                separatorBuilder: (ctx, idx) => SizedBox(height: size.height * 0.01),
                itemBuilder: (context, index) {
                  final fee = controller.feeHistory[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: fee.status == FeeStatus.paid
                            ? AppColors.success.withOpacity(0.12)
                            : AppColors.warning.withOpacity(0.12),
                        child: Icon(
                          fee.status == FeeStatus.paid ? Icons.receipt_long : Icons.pending_actions,
                          color: fee.status == FeeStatus.paid ? AppColors.success : AppColors.warning,
                        ),
                      ),
                      title: Text(
                        fee.monthYear,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        fee.status == FeeStatus.paid
                            ? 'Paid via ${fee.paymentMethod} • ${fee.receiptNumber}'
                            : 'Due Date: 10 Oct 2026',
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Rs. ${fee.amount.toStringAsFixed(0)}',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(height: 2),
                          AppStatusChip(status: fee.status.name.toUpperCase()),
                        ],
                      ),
                      onTap: fee.status == FeeStatus.paid
                          ? () => _showReceiptDialog(context, fee)
                          : null,
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

  void _showPaymentMethodSheet(BuildContext context, FeeModel fee) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Payment Gateway',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Fee Amount: Rs. ${fee.amount.toStringAsFixed(0)} for ${fee.monthYear}',
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet, color: Colors.red),
              title: const Text('JazzCash Wallet'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => controller.processFeePayment(fee, 'JazzCash'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.mobile_friendly, color: Colors.green),
              title: const Text('Easypaisa Wallet'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => controller.processFeePayment(fee, 'Easypaisa'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.account_balance, color: AppColors.deepForest),
              title: const Text('Bank Transfer / Debit Card'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => controller.processFeePayment(fee, 'Bank Transfer'),
            ),
          ],
        ),
      ),
    );
  }

  void _showReceiptDialog(BuildContext context, FeeModel fee) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, color: AppColors.success, size: 50),
              const SizedBox(height: 12),
              const Text('Official Fee Receipt', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 4),
              Text(fee.receiptNumber ?? 'REC-100293', style: const TextStyle(color: Colors.grey, fontSize: 12)),
              const Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Student Name:'),
                  Text(fee.studentName, style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Billing Month:'),
                  Text(fee.monthYear, style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Amount Paid:'),
                  Text('Rs. ${fee.amount.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.success)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Payment Method:'),
                  Text(fee.paymentMethod ?? 'JazzCash', style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Get.back(),
                child: const Text('Close Receipt'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

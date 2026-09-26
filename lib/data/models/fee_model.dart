import '../../core/enums/app_enums.dart';

class FeeModel {
  final String id;
  final String studentId;
  final String studentName;
  final String monthYear; // e.g. "September 2026"
  final double amount; // Configurable e.g. Rs. 3,500
  final double previousBalance;
  final DateTime dueDate;
  final FeeStatus status; // paid, pending, overdue
  final String? paymentMethod; // JazzCash, Easypaisa, Bank
  final DateTime? paidAt;
  final String? receiptNumber;

  FeeModel({
    required this.id,
    required this.studentId,
    required this.studentName,
    required this.monthYear,
    required this.amount,
    this.previousBalance = 0.0,
    required this.dueDate,
    required this.status,
    this.paymentMethod,
    this.paidAt,
    this.receiptNumber,
  });

  double get totalDue => amount + previousBalance;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'studentId': studentId,
      'studentName': studentName,
      'monthYear': monthYear,
      'amount': amount,
      'previousBalance': previousBalance,
      'dueDate': dueDate.toIso8601String(),
      'status': status.name,
      'paymentMethod': paymentMethod,
      'paidAt': paidAt?.toIso8601String(),
      'receiptNumber': receiptNumber,
    };
  }

  factory FeeModel.fromMap(Map<String, dynamic> map, String docId) {
    return FeeModel(
      id: docId,
      studentId: map['studentId'] ?? '',
      studentName: map['studentName'] ?? '',
      monthYear: map['monthYear'] ?? '',
      amount: (map['amount'] ?? 3500.0).toDouble(),
      previousBalance: (map['previousBalance'] ?? 0.0).toDouble(),
      dueDate: DateTime.parse(map['dueDate']),
      status: FeeStatus.values.firstWhere(
        (e) => e.name == map['status'],
        orElse: () => FeeStatus.pending,
      ),
      paymentMethod: map['paymentMethod'],
      paidAt: map['paidAt'] != null ? DateTime.parse(map['paidAt']) : null,
      receiptNumber: map['receiptNumber'],
    );
  }
}

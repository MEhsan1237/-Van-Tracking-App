import '../../core/enums/app_enums.dart';

class LeaveRequestModel {
  final String id;
  final String studentId;
  final String studentName;
  final String parentId;
  final DateTime fromDate;
  final DateTime toDate;
  final String reason;
  final LeaveStatus status;
  final String? rejectionReason;
  final DateTime createdAt;

  LeaveRequestModel({
    required this.id,
    required this.studentId,
    required this.studentName,
    required this.parentId,
    required this.fromDate,
    required this.toDate,
    required this.reason,
    this.status = LeaveStatus.pending,
    this.rejectionReason,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'studentId': studentId,
      'studentName': studentName,
      'parentId': parentId,
      'fromDate': fromDate.toIso8601String(),
      'toDate': toDate.toIso8601String(),
      'reason': reason,
      'status': status.name,
      'rejectionReason': rejectionReason,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory LeaveRequestModel.fromMap(Map<String, dynamic> map, String docId) {
    return LeaveRequestModel(
      id: docId,
      studentId: map['studentId'] ?? '',
      studentName: map['studentName'] ?? '',
      parentId: map['parentId'] ?? '',
      fromDate: DateTime.parse(map['fromDate']),
      toDate: DateTime.parse(map['toDate']),
      reason: map['reason'] ?? '',
      status: LeaveStatus.values.firstWhere(
        (e) => e.name == map['status'],
        orElse: () => LeaveStatus.pending,
      ),
      rejectionReason: map['rejectionReason'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}

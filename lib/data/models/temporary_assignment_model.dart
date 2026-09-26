class TemporaryAssignmentModel {
  final String id;
  final String studentId;
  final String studentName;
  final String originalVanId;
  final String temporaryVanId;
  final String? tripId;
  final DateTime validFrom;
  final DateTime validUntil;
  final String tripType; // Morning / Return / Both
  final String reason;
  final String status; // Approved, Pending, Rejected
  final String createdBy;

  TemporaryAssignmentModel({
    required this.id,
    required this.studentId,
    required this.studentName,
    required this.originalVanId,
    required this.temporaryVanId,
    this.tripId,
    required this.validFrom,
    required this.validUntil,
    required this.tripType,
    required this.reason,
    required this.status,
    required this.createdBy,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'studentId': studentId,
      'studentName': studentName,
      'originalVanId': originalVanId,
      'temporaryVanId': temporaryVanId,
      'tripId': tripId,
      'validFrom': validFrom.toIso8601String(),
      'validUntil': validUntil.toIso8601String(),
      'tripType': tripType,
      'reason': reason,
      'status': status,
      'createdBy': createdBy,
    };
  }

  factory TemporaryAssignmentModel.fromMap(Map<String, dynamic> map, String docId) {
    return TemporaryAssignmentModel(
      id: docId,
      studentId: map['studentId'] ?? '',
      studentName: map['studentName'] ?? '',
      originalVanId: map['originalVanId'] ?? '',
      temporaryVanId: map['temporaryVanId'] ?? '',
      tripId: map['tripId'],
      validFrom: DateTime.parse(map['validFrom']),
      validUntil: DateTime.parse(map['validUntil']),
      tripType: map['tripType'] ?? 'Morning',
      reason: map['reason'] ?? '',
      status: map['status'] ?? 'Pending',
      createdBy: map['createdBy'] ?? '',
    );
  }
}

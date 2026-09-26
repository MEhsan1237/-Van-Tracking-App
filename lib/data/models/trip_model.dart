import '../../core/enums/app_enums.dart';

class TripModel {
  final String id;
  final String vanId;
  final String vanNumber;
  final String driverId;
  final String driverName;
  final String routeName;
  final String tripType; // Morning Pickup / Return Drop
  final TripStatus status;
  final DateTime startTime;
  final DateTime? endTime;
  final int totalStudentsAssigned;
  final int boardedCount;
  final int droppedCount;
  final int absentCount;
  final int leaveCount;
  final double distanceKm;
  final int durationMinutes;

  TripModel({
    required this.id,
    required this.vanId,
    required this.vanNumber,
    required this.driverId,
    required this.driverName,
    required this.routeName,
    required this.tripType,
    required this.status,
    required this.startTime,
    this.endTime,
    required this.totalStudentsAssigned,
    required this.boardedCount,
    required this.droppedCount,
    required this.absentCount,
    required this.leaveCount,
    this.distanceKm = 0.0,
    this.durationMinutes = 0,
  });

  int get stillOnboardCount => boardedCount - droppedCount;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'vanId': vanId,
      'vanNumber': vanNumber,
      'driverId': driverId,
      'driverName': driverName,
      'routeName': routeName,
      'tripType': tripType,
      'status': status.name,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime?.toIso8601String(),
      'totalStudentsAssigned': totalStudentsAssigned,
      'boardedCount': boardedCount,
      'droppedCount': droppedCount,
      'absentCount': absentCount,
      'leaveCount': leaveCount,
      'distanceKm': distanceKm,
      'durationMinutes': durationMinutes,
    };
  }

  factory TripModel.fromMap(Map<String, dynamic> map, String docId) {
    return TripModel(
      id: docId,
      vanId: map['vanId'] ?? '',
      vanNumber: map['vanNumber'] ?? '',
      driverId: map['driverId'] ?? '',
      driverName: map['driverName'] ?? '',
      routeName: map['routeName'] ?? '',
      tripType: map['tripType'] ?? 'Morning',
      status: TripStatus.values.firstWhere(
        (e) => e.name == map['status'],
        orElse: () => TripStatus.scheduled,
      ),
      startTime: DateTime.parse(map['startTime']),
      endTime: map['endTime'] != null ? DateTime.parse(map['endTime']) : null,
      totalStudentsAssigned: map['totalStudentsAssigned'] ?? 0,
      boardedCount: map['boardedCount'] ?? 0,
      droppedCount: map['droppedCount'] ?? 0,
      absentCount: map['absentCount'] ?? 0,
      leaveCount: map['leaveCount'] ?? 0,
      distanceKm: (map['distanceKm'] ?? 0.0).toDouble(),
      durationMinutes: map['durationMinutes'] ?? 0,
    );
  }
}

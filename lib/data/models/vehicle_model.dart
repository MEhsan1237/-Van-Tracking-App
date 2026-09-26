class VehicleModel {
  final String id;
  final String vanNumber; // e.g. VAN-02
  final String registrationPlate; // e.g. LEA-4589
  final int capacity; // e.g. 30
  final int assignedCount; // e.g. 28
  final int onboardCount; // e.g. 21
  final String driverId;
  final String driverName;
  final String driverPhone;
  final String routeName;
  final bool isActive;
  final double currentLat;
  final double currentLng;
  final DateTime? lastLocationUpdate;

  VehicleModel({
    required this.id,
    required this.vanNumber,
    required this.registrationPlate,
    required this.capacity,
    required this.assignedCount,
    required this.onboardCount,
    required this.driverId,
    required this.driverName,
    required this.driverPhone,
    required this.routeName,
    this.isActive = true,
    this.currentLat = 0.0,
    this.currentLng = 0.0,
    this.lastLocationUpdate,
  });

  int get availableCapacity => capacity - assignedCount;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'vanNumber': vanNumber,
      'registrationPlate': registrationPlate,
      'capacity': capacity,
      'assignedCount': assignedCount,
      'onboardCount': onboardCount,
      'driverId': driverId,
      'driverName': driverName,
      'driverPhone': driverPhone,
      'routeName': routeName,
      'isActive': isActive,
      'currentLat': currentLat,
      'currentLng': currentLng,
      'lastLocationUpdate': lastLocationUpdate?.toIso8601String(),
    };
  }

  factory VehicleModel.fromMap(Map<String, dynamic> map, String docId) {
    return VehicleModel(
      id: docId,
      vanNumber: map['vanNumber'] ?? '',
      registrationPlate: map['registrationPlate'] ?? '',
      capacity: map['capacity'] ?? 30,
      assignedCount: map['assignedCount'] ?? 0,
      onboardCount: map['onboardCount'] ?? 0,
      driverId: map['driverId'] ?? '',
      driverName: map['driverName'] ?? '',
      driverPhone: map['driverPhone'] ?? '',
      routeName: map['routeName'] ?? '',
      isActive: map['isActive'] ?? true,
      currentLat: (map['currentLat'] ?? 0.0).toDouble(),
      currentLng: (map['currentLng'] ?? 0.0).toDouble(),
      lastLocationUpdate: map['lastLocationUpdate'] != null
          ? DateTime.tryParse(map['lastLocationUpdate'])
          : null,
    );
  }
}

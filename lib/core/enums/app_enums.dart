enum UserRole {
  admin,
  driver,
  parent,
  student,
}

extension UserRoleExtension on UserRole {
  String get value {
    switch (this) {
      case UserRole.admin:
        return 'ADMIN';
      case UserRole.driver:
        return 'DRIVER';
      case UserRole.parent:
        return 'PARENT';
      case UserRole.student:
        return 'STUDENT';
    }
  }

  static UserRole fromString(String roleStr) {
    switch (roleStr.toUpperCase()) {
      case 'ADMIN':
        return UserRole.admin;
      case 'DRIVER':
        return UserRole.driver;
      case 'PARENT':
        return UserRole.parent;
      case 'STUDENT':
      default:
        return UserRole.student;
    }
  }
}

enum TransportEventType {
  waitingHome,
  pickedUpHome,
  onboard,
  droppedAtSchool,
  waitingSchool,
  pickedUpSchool,
  onboardReturn,
  droppedAtHome,
}

enum TripStatus {
  scheduled,
  inProgress,
  completed,
  cancelled,
}

enum LeaveStatus {
  pending,
  approved,
  rejected,
}

enum FeeStatus {
  paid,
  pending,
  overdue,
}

enum ScannerState {
  permissionNotRequested,
  permissionDenied,
  permissionPermanentlyDenied,
  cameraInitializing,
  ready,
  scanning,
  validating,
  authorized,
  unauthorized,
  duplicateScan,
  networkUnavailable,
  error,
}

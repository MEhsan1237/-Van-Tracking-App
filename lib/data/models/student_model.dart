class StudentModel {
  final String id;
  final String studentCode; // e.g. STU-101
  final String name;
  final String className;
  final String parentId;
  final String parentName;
  final String parentPhone;
  final String permanentVanId;
  final String permanentVanNumber;
  final String pickupPoint;
  final String dropPoint;
  final String qrToken; // Opaque identity token
  final String? photoUrl;
  final String status; // Present, Absent, Onboard, Leave

  StudentModel({
    required this.id,
    required this.studentCode,
    required this.name,
    required this.className,
    required this.parentId,
    required this.parentName,
    required this.parentPhone,
    required this.permanentVanId,
    required this.permanentVanNumber,
    required this.pickupPoint,
    required this.dropPoint,
    required this.qrToken,
    this.photoUrl,
    this.status = 'Present',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'studentCode': studentCode,
      'name': name,
      'className': className,
      'parentId': parentId,
      'parentName': parentName,
      'parentPhone': parentPhone,
      'permanentVanId': permanentVanId,
      'permanentVanNumber': permanentVanNumber,
      'pickupPoint': pickupPoint,
      'dropPoint': dropPoint,
      'qrToken': qrToken,
      'photoUrl': photoUrl,
      'status': status,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map, String docId) {
    return StudentModel(
      id: docId,
      studentCode: map['studentCode'] ?? '',
      name: map['name'] ?? '',
      className: map['className'] ?? '',
      parentId: map['parentId'] ?? '',
      parentName: map['parentName'] ?? '',
      parentPhone: map['parentPhone'] ?? '',
      permanentVanId: map['permanentVanId'] ?? '',
      permanentVanNumber: map['permanentVanNumber'] ?? '',
      pickupPoint: map['pickupPoint'] ?? '',
      dropPoint: map['dropPoint'] ?? '',
      qrToken: map['qrToken'] ?? docId,
      photoUrl: map['photoUrl'],
      status: map['status'] ?? 'Present',
    );
  }
}

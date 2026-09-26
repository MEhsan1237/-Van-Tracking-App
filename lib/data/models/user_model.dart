import 'dart:convert';
import '../../core/enums/app_enums.dart';

class UserModel {
  final String uid;
  final String email;
  final String name;
  final UserRole role;
  final String? phoneNumber;
  final String? profileImageUrl;
  final bool isEmailVerified;
  final String? assignedVanId;
  final List<String>? linkedStudentIds; // For Parents
  final DateTime? createdAt;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.role,
    this.phoneNumber,
    this.profileImageUrl,
    this.isEmailVerified = false,
    this.assignedVanId,
    this.linkedStudentIds,
    this.createdAt,
  });

  UserModel copyWith({
    String? uid,
    String? email,
    String? name,
    UserRole? role,
    String? phoneNumber,
    String? profileImageUrl,
    bool? isEmailVerified,
    String? assignedVanId,
    List<String>? linkedStudentIds,
    DateTime? createdAt,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      role: role ?? this.role,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      assignedVanId: assignedVanId ?? this.assignedVanId,
      linkedStudentIds: linkedStudentIds ?? this.linkedStudentIds,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'role': role.value,
      'phoneNumber': phoneNumber,
      'profileImageUrl': profileImageUrl,
      'isEmailVerified': isEmailVerified,
      'assignedVanId': assignedVanId,
      'linkedStudentIds': linkedStudentIds,
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      role: UserRoleExtension.fromString(map['role'] ?? 'STUDENT'),
      phoneNumber: map['phoneNumber'],
      profileImageUrl: map['profileImageUrl'],
      isEmailVerified: map['isEmailVerified'] ?? false,
      assignedVanId: map['assignedVanId'],
      linkedStudentIds: map['linkedStudentIds'] != null
          ? List<String>.from(map['linkedStudentIds'])
          : null,
      createdAt: map['createdAt'] != null ? DateTime.tryParse(map['createdAt']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}

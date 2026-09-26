import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';
import '../models/student_model.dart';
import '../models/vehicle_model.dart';
import '../models/temporary_assignment_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // User Document Methods
  Future<void> createUserProfile(UserModel user) async {
    await _firestore.collection('users').doc(user.uid).set(user.toMap(), SetOptions(merge: true));
  }

  Future<UserModel?> getUserProfile(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    if (doc.exists && doc.data() != null) {
      return UserModel.fromMap(doc.data()!);
    }
    return null;
  }

  Future<void> updateUserProfile(UserModel user) async {
    await _firestore.collection('users').doc(user.uid).update(user.toMap());
  }

  // Vehicles / Vans
  Stream<List<VehicleModel>> getActiveVehiclesStream() {
    return _firestore.collection('vehicles').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => VehicleModel.fromMap(doc.data(), doc.id)).toList();
    });
  }

  Future<VehicleModel?> getVehicle(String vanId) async {
    final doc = await _firestore.collection('vehicles').doc(vanId).get();
    if (doc.exists && doc.data() != null) {
      return VehicleModel.fromMap(doc.data()!, doc.id);
    }
    return null;
  }

  // Students
  Stream<List<StudentModel>> getStudentsByVanStream(String vanId) {
    return _firestore
        .collection('students')
        .where('permanentVanId', isEqualTo: vanId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => StudentModel.fromMap(doc.data(), doc.id)).toList();
    });
  }

  Future<StudentModel?> getStudentByQrToken(String qrToken) async {
    final snapshot = await _firestore
        .collection('students')
        .where('qrToken', isEqualTo: qrToken)
        .limit(1)
        .get();
    if (snapshot.docs.isNotEmpty) {
      return StudentModel.fromMap(snapshot.docs.first.data(), snapshot.docs.first.id);
    }
    return null;
  }

  // Temporary Van Assignments
  Future<TemporaryAssignmentModel?> getActiveTemporaryAssignment(String studentId) async {
    final snapshot = await _firestore
        .collection('temporary_assignments')
        .where('studentId', isEqualTo: studentId)
        .where('status', isEqualTo: 'Approved')
        .get();

    for (var doc in snapshot.docs) {
      final item = TemporaryAssignmentModel.fromMap(doc.data(), doc.id);
      if (item.validFrom.isBefore(DateTime.now()) && item.validUntil.isAfter(DateTime.now())) {
        return item;
      }
    }
    return null;
  }

  Future<void> createTemporaryAssignment(TemporaryAssignmentModel assignment) async {
    await _firestore.collection('temporary_assignments').add(assignment.toMap());
  }
}

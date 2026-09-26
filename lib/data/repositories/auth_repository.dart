import '../models/user_model.dart';
import '../services/firebase_auth_service.dart';
import '../services/firestore_service.dart';
import '../services/local_storage_service.dart';
import '../../core/enums/app_enums.dart';

class AuthRepository {
  final FirebaseAuthService _authService;
  final FirestoreService _firestoreService;
  final LocalStorageService _localStorageService;

  AuthRepository({
    FirebaseAuthService? authService,
    FirestoreService? firestoreService,
    LocalStorageService? localStorageService,
  })  : _authService = authService ?? FirebaseAuthService(),
        _firestoreService = firestoreService ?? FirestoreService(),
        _localStorageService = localStorageService ?? LocalStorageService();

  Future<UserModel?> getCachedUser() async {
    return await _localStorageService.getUser();
  }

  Future<UserModel?> signInWithEmail(String email, String password) async {
    final cred = await _authService.signInWithEmailAndPassword(email, password);
    final user = cred.user;
    if (user != null) {
      UserModel? profile = await _firestoreService.getUserProfile(user.uid);
      if (profile == null) {
        // Fallback default if profile doc missing
        profile = UserModel(
          uid: user.uid,
          email: user.email ?? email,
          name: user.displayName ?? email.split('@').first,
          role: UserRole.parent,
          isEmailVerified: user.emailVerified,
        );
        await _firestoreService.createUserProfile(profile);
      } else {
        profile = profile.copyWith(isEmailVerified: user.emailVerified);
      }
      await _localStorageService.saveUser(profile);
      return profile;
    }
    return null;
  }

  Future<UserModel?> signUpWithEmail({
    required String email,
    required String password,
    required String name,
    required UserRole role,
  }) async {
    final cred = await _authService.createUserWithEmailAndPassword(email, password);
    final user = cred.user;
    if (user != null) {
      final profile = UserModel(
        uid: user.uid,
        email: email,
        name: name,
        role: role,
        isEmailVerified: false,
        createdAt: DateTime.now(),
      );
      await _firestoreService.createUserProfile(profile);
      await _authService.sendEmailVerification();
      await _localStorageService.saveUser(profile);
      return profile;
    }
    return null;
  }

  Future<UserModel?> signInWithGoogle() async {
    final cred = await _authService.signInWithGoogle();
    if (cred == null || cred.user == null) return null;
    final user = cred.user!;

    UserModel? profile = await _firestoreService.getUserProfile(user.uid);
    if (profile == null) {
      profile = UserModel(
        uid: user.uid,
        email: user.email ?? '',
        name: user.displayName ?? 'Google User',
        role: UserRole.parent, // Default role for Google Auth
        isEmailVerified: true,
        profileImageUrl: user.photoURL,
        createdAt: DateTime.now(),
      );
      await _firestoreService.createUserProfile(profile);
    }
    await _localStorageService.saveUser(profile);
    return profile;
  }

  Future<void> sendEmailVerification() async {
    await _authService.sendEmailVerification();
  }

  Future<bool> checkEmailVerified() async {
    final isVerified = await _authService.checkEmailVerified();
    final cached = await _localStorageService.getUser();
    if (cached != null && isVerified) {
      final updated = cached.copyWith(isEmailVerified: true);
      await _localStorageService.saveUser(updated);
      await _firestoreService.updateUserProfile(updated);
    }
    return isVerified;
  }

  Future<void> sendPasswordReset(String email) async {
    await _authService.sendPasswordResetEmail(email);
  }

  Future<void> updateUserProfile(UserModel updatedUser) async {
    await _firestoreService.updateUserProfile(updatedUser);
    await _localStorageService.saveUser(updatedUser);
  }

  Future<void> logout() async {
    await _authService.signOut();
    await _localStorageService.clearUser();
  }
}

part of 'salon_registration_repository.dart';

class FirebaseSalonRegistrationAuthService
    implements SalonRegistrationAuthService {
  @override
  Future<UserCredential> registerUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }
}

abstract class SalonRegistrationAuthService {
  Future<UserCredential> registerUserWithEmailAndPassword({
    required String email,
    required String password,
  });
}

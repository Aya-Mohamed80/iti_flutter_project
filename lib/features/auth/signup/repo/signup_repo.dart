import 'package:iti_project/core/utiles/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance; // singleton

  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? AppStrings.signupfailed);
    }
  }
}

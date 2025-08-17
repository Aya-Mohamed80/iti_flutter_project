import 'package:firebase_auth/firebase_auth.dart';
import 'package:iti_project/core/utiles/app_strings.dart';

class LoginRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance; // singleton

  Future<User?> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? AppStrings.loginfailed);
    }
  }
}

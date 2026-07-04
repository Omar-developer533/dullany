import 'package:dullany/core/functions/phon_to_email.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<void> registerWithEmailAndPasswored(
    String phon,
    String passwored,
  ) async {
    String email = phonToEmail(phon);
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: passwored,
    );
  }

  Future<void> loginWithEmailAndPasswored(String phon, String passwored) async {
    String email = phonToEmail(phon);
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: passwored,
    );
  }
}

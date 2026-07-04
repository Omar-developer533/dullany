import 'package:dartz/dartz.dart';
import 'package:dullany/core/firebase/firebase_auth_service.dart';
import 'package:dullany/features/auth/data/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<String, void>> login(String phonNum, String passwored) async {
    try {
      await firebaseAuthService.registerWithEmailAndPasswored(
        phonNum,
        passwored,
      );
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> registerUser(
    String phonNum,
    String passwored,
  ) async {
    try {
      await firebaseAuthService.loginWithEmailAndPasswored(phonNum, passwored);
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(e.toString());
    }
  }
}

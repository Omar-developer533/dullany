import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class FirebaseFailure extends Failure {
  FirebaseFailure({required super.errorMessage});
  factory FirebaseFailure.fromFirebaseAuthException(
    FirebaseAuthException failure,
  ) {
    if (failure.code == 'weak-password') {
      return FirebaseFailure(errorMessage: 'the password is to weak');
    } else if (failure.code == 'email-already-in-use') {
      return FirebaseFailure(errorMessage: 'the email already exists');
    } else if (failure.code == 'user-not-found' ||
        failure.code == 'invalid-credential') {
      return FirebaseFailure(errorMessage: 'the user is not found');
    } else if (failure.code == 'wrong-password') {
      return FirebaseFailure(errorMessage: 'the password is wrong');
    } else {
      return FirebaseFailure(
        errorMessage: 'oops there was something,please try later',
      );
    }
  }
}

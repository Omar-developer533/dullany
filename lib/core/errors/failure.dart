import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class FirebaseAuthFailure extends Failure {
  FirebaseAuthFailure({required super.errorMessage});
  factory FirebaseAuthFailure.fromFirebaseAuthException(
    FirebaseAuthException failure,
  ) {
    if (failure.code == 'weak-password') {
      return FirebaseAuthFailure(errorMessage: 'the password is to weak');
    } else if (failure.code == 'email-already-in-use') {
      return FirebaseAuthFailure(errorMessage: 'the email already exists');
    } else if (failure.code == 'user-not-found' ||
        failure.code == 'invalid-credential') {
      return FirebaseAuthFailure(errorMessage: 'the user is not found');
    } else if (failure.code == 'wrong-password') {
      return FirebaseAuthFailure(errorMessage: 'the password is wrong');
    } else {
      return FirebaseAuthFailure(
        errorMessage: 'oops there was something,please try later',
      );
    }
  }
}

class FirebaseFireStorFailure extends Failure {
  FirebaseFireStorFailure({required super.errorMessage});
  factory FirebaseFireStorFailure.fromFirebaseException(
    FirebaseException error,
  ) {
    switch (error.code) {
      case 'permission-denied':
        return FirebaseFireStorFailure(
          errorMessage: "ليس لديك صلاحية للقيام بهذا الإجراء.",
        );

      case 'unavailable':
        return FirebaseFireStorFailure(
          errorMessage:
              "الخدمة غير متاحة حالياً، يرجى التأكد من اتصالك بالإنترنت.",
        );

      case 'not-found':
        return FirebaseFireStorFailure(
          errorMessage: "المستند المطلوب غير موجود.",
        );

      case 'deadline-exceeded':
        return FirebaseFireStorFailure(
          errorMessage: "انتهت مهلة الطلب، يرجى المحاولة لاحقاً.",
        );

      default:
        return FirebaseFireStorFailure(
          errorMessage: "حدث خطأ غير معروف: ${error.code}",
        );
    }
  }
}

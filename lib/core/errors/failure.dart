import 'package:dio/dio.dart';
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

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});
  factory ServerFailure.fromDioeror(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: 'انتهت مهلة الأتصال بالخادم');

      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'انتهت مهلة الارسال');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'انتهت مهلت الاستقبال');
      case DioExceptionType.badCertificate:
        return ServerFailure(
          errorMessage: 'تعذر الاتصال بالخادم بسبب شهادة أمان غير صالحة',
        );
      case DioExceptionType.badResponse:
        ServerFailure.fromBadResponse(e.response);
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: 'تم إلغاء الطلب');
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: 'خطأ الاتصال بالخادم');
      case DioExceptionType.unknown:
        return ServerFailure(errorMessage: 'حدث خطأ ما');
      case DioExceptionType.transformTimeout:
        return ServerFailure(errorMessage: 'نتهت مهلة معالجة البيانات');
    }
    return ServerFailure(errorMessage: 'حدث خطأ ما , حاول لاحقا');
  }
  factory ServerFailure.fromBadResponse(dynamic response) {
    if (response['status code'] == 404) {
      return ServerFailure(errorMessage: '');
    } else if (response['status code'] == 500) {
      return ServerFailure(errorMessage: '');
    } else if (response['status code'] == 400 ||
        response['status code'] == 403 ||
        response['status code'] == 401) {
      return ServerFailure(errorMessage: response['error']['message']);
    } else {
      return ServerFailure(errorMessage: 'يوجد خطأ ما حاول لاحقا');
    }
  }
}

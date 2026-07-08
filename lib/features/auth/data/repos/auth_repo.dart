import 'package:dartz/dartz.dart';
import 'package:dullany/core/errors/failure.dart';

abstract class AuthRepo {


  Future<Either<Failure,void>> registerUser(String phonNum, String passwored);

 Future<Either<Failure,void>>login(String phonNum, String passwored);
}

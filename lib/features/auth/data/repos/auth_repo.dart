import 'package:dartz/dartz.dart';

abstract class AuthRepo {


  Future<Either<String,void>> registerUser(String phonNum, String passwored);

 Future<Either<String,void>>login(String phonNum, String passwored);
}

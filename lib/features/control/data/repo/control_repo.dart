import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dullany/core/errors/failure.dart';

abstract class ControlRepo {
  Future<Either<Failure, void>> addDoc(Map<String, dynamic> docValue);
  Future<Either<Failure,QuerySnapshot<Map<String,dynamic>>>> getAllDoc();
  Future<Either<Failure, DocumentSnapshot<Map<String, dynamic>>>> getDoc(
    String docId,
  );

  Future<Either<Failure, void>> updateCategory(String docId,Map<String,dynamic>docValue);
  Future<Either<Failure, void>> deleteCategory(String categoryId);
}

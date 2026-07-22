import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dullany/core/errors/failure.dart';

abstract class ControlRepo {
  Future<Either<Failure, void>> addDoc(String collectionName,Map<String, dynamic> docValue);
  Future<Either<Failure,QuerySnapshot<Map<String,dynamic>>>> getAllDoc(String collectionName,);
  Future<Either<Failure, DocumentSnapshot<Map<String, dynamic>>>> getDoc(String collectionName,
    String docId,
  );

  Future<Either<Failure, void>> updateCategory(String collectionName,String docId,Map<String,dynamic>docValue);
  Future<Either<Failure, void>> deleteCategory(String collectionName,String categoryId);
}

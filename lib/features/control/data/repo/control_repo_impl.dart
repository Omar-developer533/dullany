import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dullany/core/errors/failure.dart';
import 'package:dullany/core/firebase/firebase_firestore_service.dart';
import 'package:dullany/features/control/data/repo/control_repo.dart';

class ControlRepoImpl extends ControlRepo {
  final FirebaseFirestoreService firebaseFirestoreService =
      FirebaseFirestoreService();
  final String collectionName;

  ControlRepoImpl({required this.collectionName});
  @override
  Future<Either<Failure, void>> addDoc(docValue) async {
    try {
      await firebaseFirestoreService.add(collectionName, docValue);
      return right(null);
    } on FirebaseException catch (e) {
      return left(FirebaseFireStorFailure.fromFirebaseException(e));
    } catch (e) {
      return left(FirebaseFireStorFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCategory(String docId) async {
    try {
      await firebaseFirestoreService.deleteDoc(collectionName, docId);
      return right(null);
    } on FirebaseException catch (e) {
      return left(FirebaseFireStorFailure.fromFirebaseException(e));
    } catch (e) {
      return left(FirebaseFireStorFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, QuerySnapshot<Map<String, dynamic>>>>
  getAllDoc() async {
    try {
      var docs = await firebaseFirestoreService.getAllDoc(collectionName);
      return right(docs);
    } on FirebaseException catch (e) {
      return left(FirebaseFireStorFailure.fromFirebaseException(e));
    } catch (e) {
      return left(FirebaseFireStorFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, DocumentSnapshot<Map<String, dynamic>>>> getDoc(
    String docId,
  ) async {
    try {
      var doc = await firebaseFirestoreService.getDoc(collectionName, docId);
      return right(doc);
    } on FirebaseException catch (e) {
      return left(FirebaseFireStorFailure.fromFirebaseException(e));
    } catch (e) {
      return left(FirebaseFireStorFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateCategory(
    String docId,
    Map<String, dynamic> docValue,
  ) async {
    try {
      await firebaseFirestoreService.updateDoc(collectionName, docId, docValue);
      return right(null);
    } on FirebaseException catch (e) {
      return left(FirebaseFireStorFailure.fromFirebaseException(e));
    } catch (e) {
      return left(FirebaseFireStorFailure(errorMessage: e.toString()));
    }
  }
}

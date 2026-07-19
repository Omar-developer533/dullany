import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreService {
  Future<void> add(String collectionName, Map<String, dynamic> docValue) async {
    await FirebaseFirestore.instance.collection(collectionName).add(docValue);
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAllDoc(
    String collectionName,
  ) async {
    dynamic documents = await FirebaseFirestore.instance
        .collection(collectionName)
        .get();
    return documents;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getDoc(
    String collectionName,
    String docId,
  ) async {
    dynamic documents = await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(docId)
        .get();
    return documents;
  }

  Future<void> updateDoc(
    String collectionName,
    String docId,
    Map<String, dynamic> value,
  ) async {
    await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(docId)
        .update(value);
  }

  Future<void> deleteDoc(String collectionName, String docId) async {
    await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(docId)
        .delete();
  }
}

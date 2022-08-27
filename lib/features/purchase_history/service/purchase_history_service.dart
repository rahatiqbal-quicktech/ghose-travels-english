import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class PurchaseHistoryService {
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>?> getPurchaseHistory(
      {required String uid}) async {
    try {
      var temp = await FirebaseFirestore.instance
          .collection("bookings")
          .where("customerUid", isEqualTo: uid)
          .get();

      var data = temp.docs;

      return data;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}

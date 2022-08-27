import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class CampaignService {
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>?>
      //
      getCampaigns() async {
    try {
      var snapshot =
          await FirebaseFirestore.instance.collection("campaigns").get();
      var temp = snapshot.docs;
      // var temp = snapshot.docs[0].data();  actual data

      return temp;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}

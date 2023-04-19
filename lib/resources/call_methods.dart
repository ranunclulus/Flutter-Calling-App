import 'package:calling/constants/string.dart';
import 'package:calling/models/call.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CallMethods {
  final CollectionReference callCollection =
  FirebaseFirestore.instance.collection(CALL_COLLECTION);

  Stream<DocumentSnapshot> callStream({required String uid}) =>
      callCollection.doc(uid).snapshots();

  Future<bool> makeCall({required Call call}) async {
    try {
      // 발신자
      call.hasDialled = true;
      Map<String, dynamic> hasDialledMap = call.toMap(call);
      // 수신자
      call.hasDialled = false;
      Map<String, dynamic> hasNotDialledMap = call.toMap(call);

      // 발신자
      await callCollection.doc(call.callerId).set(hasDialledMap);
      // 수신자
      await callCollection.doc(call.receiverId).set(hasNotDialledMap);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> endCall({required Call call}) async {
    try {
      await callCollection.doc(call.callerId).delete();
      await callCollection.doc(call.receiverId).delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
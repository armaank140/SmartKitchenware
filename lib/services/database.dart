import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference  kwcollection = Firestore.instance.collection('Containers');

  Future updateUserData(String cname, int per) async{
    return await kwcollection.document(uid).setData({
      'cname' : cname,
      'per'  : per,
    });
  }



}
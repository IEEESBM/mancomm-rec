import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/reg.dart';

class DatabaseService {

  final CollectionReference regCollection =
      Firestore.instance.collection('reg');

  Future addNewReg(RegForm formRes) async {

    var timestamp = FieldValue.serverTimestamp();

    return await regCollection.document().setData({
      'name': formRes.name,
      'email': formRes.email,
      'pNo': formRes.pNo,
      'regNo': formRes.regNo,
      'streamIndex': formRes.streamIndex,
      'domainIndices': formRes.domainIndices,
      'linkToProj':formRes.linkToProj,
      'timeStamp': timestamp
    });
  }

  Future<bool> checkIfReg(RegForm formRes) async {
    var length = await regCollection
        .where("email", isEqualTo: formRes.email)
        .getDocuments();

    if (length.documents.isNotEmpty) {
      print(length.documents);
      return true;
    }

    return false;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {
  final FirebaseFirestore firebaseFirestore;

  DataService(this.firebaseFirestore);

  Future<List<String>?> getTeacherData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> data;
      List<String> output = [];

      data = await firebaseFirestore.collection('teacherNames').get();
      for (int i = 0; i < data.docs.length; i++) {
        output.add(data.docs.elementAt(i).data().values.first.toString());
      }
      return output;
    } catch (e) {
      return ['An error has occured: $e'];
    }
  }

  Future<List<String>?> getClasses({required String teacherName}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> data;

      data = await firebaseFirestore.collection('classes').get();
      for (int i = 0; i < data.docs.length; i++) {
        if (data.docs.elementAt(i).data().values.last.toString() ==
            teacherName) {
          return data.docs.elementAt(i).data().values.first as List<String>;
        }
      }
    } catch (e) {
      return ['An error has occured: $e'];
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataService {
  final FirebaseFirestore firebaseFirestore;

  DataService(this.firebaseFirestore);

  Future<List<String>?> getTeacherData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> data;
      List<String> output = [];

      data = await firebaseFirestore.collection('classes').get();
      for (int i = 0; i < data.docs.length; i++) {
        output.add(data.docs.elementAt(i).data().values.last.toString());
      }
      return output;
    } catch (e) {
      return ['An error has occured: $e'];
    }
  }

  Future<List<dynamic>?> getClasses({required String teacherName}) async {
    try {
      if (teacherName == 'Select Teacher') {
        return ['Please select a teacher first'];
      } else {
        QuerySnapshot<Map<String, dynamic>> data;
        List returnData = [];
        data = await firebaseFirestore.collection('classes').get();
        for (int i = 0; i < data.docs.length; i++) {
          if (data.docs.elementAt(i).data().values.last.toString() ==
              teacherName) {
            returnData = data.docs.elementAt(i).data().values.first;
            return returnData;
          }
        }
      }
    } catch (e) {
      return ['An error has occured: $e'];
    }
  }

  void sendData(
      {required List<String> teachers, required List<String> classes}) async {
    try {
      await FirebaseFirestore.instance
          .collection('studentClasses')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'Period 1': [teachers.elementAt(0), classes.elementAt(0)],
        'Period 2': [teachers.elementAt(1), classes.elementAt(1)],
        'Period 3': [teachers.elementAt(2), classes.elementAt(2)],
        'Period 4': [teachers.elementAt(3), classes.elementAt(3)],
        'Period 5': [teachers.elementAt(4), classes.elementAt(4)],
        'Period 6': [teachers.elementAt(5), classes.elementAt(5)],
        'Period 7': [teachers.elementAt(6), classes.elementAt(6)]
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<bool> hasSchedule() async {
    QuerySnapshot<Map<String, dynamic>> data;
    bool value = false;

    data = await firebaseFirestore.collection('studentClasses').get();
    for (int i = 0; i < data.size; i++) {
      if (data.docs.elementAt(i).id == FirebaseAuth.instance.currentUser!.uid) {
        value = true;
      }
    }
    return value;
  }

  Future<Map> getStudentClasses() async {
    Map<String, dynamic> endValue = {};

    await firebaseFirestore.collection('studentClasses').get().then((value) {
      for (int i = 0; i < value.size; i++) {
        if (value.docs.elementAt(i).id ==
            FirebaseAuth.instance.currentUser!.uid) {
          endValue = value.docs.elementAt(i).data();
        }
      }
    });
    return endValue;
  }
}

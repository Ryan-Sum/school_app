import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:school_app/data_service.dart';

class InputCard extends StatefulWidget {
  final int period;
  final Function(String) teacherChange;
  final Function(String) classChange;

  const InputCard({
    Key? key,
    required this.period,
    required this.teacherChange,
    required this.classChange,
  }) : super(key: key);

  @override
  _InputCardState createState() => _InputCardState();
}

class _InputCardState extends State<InputCard> {
  Object? teacherValue = 'Select Teacher';
  Object? classValue = 'Please select a teacher first';
  List<String> teachers = ['Select Teacher'];
  List<String> classes = ['Please select a teacher first'];
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  void startup() async {
    await DataService(firebaseFirestore).getTeacherData().then((value) {
      setState(() {
        value!.insert(0, 'Select Teacher');
        teachers = value;
        teacherValue = teachers.first.toString();
      });
    });
    DataService(firebaseFirestore)
        .getClasses(teacherName: teacherValue.toString())
        .then((value) {
      setState(() {
        classes = value!.cast<String>();
        classValue = classes.first.toString();
      });
    });
  }

  void updateClasses() {
    DataService(firebaseFirestore)
        .getClasses(teacherName: teacherValue.toString())
        .then((value) {
      setState(() {
        classes = value!.cast<String>();
        if (teacherValue != 'Select Teacher') {
          classes.insert(0, 'Select Class');
        }
        classValue = classes.first.toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startup();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Period ${widget.period + 1}'),
            DropdownButtonFormField(
              value: teacherValue,
              onChanged: (Object? newValue) {
                teacherValue = newValue.toString();
                updateClasses();
                widget.teacherChange(teacherValue.toString());
              },
              items: teachers.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            DropdownButtonFormField(
              value: classValue,
              onChanged: (Object? newValue) {
                classValue = newValue.toString();
                widget.classChange(classValue.toString());
              },
              items: classes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

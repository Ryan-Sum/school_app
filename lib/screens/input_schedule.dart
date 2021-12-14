import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:school_app/widgets/app_bar.dart';

import '../data_service.dart';

class InputSchedule extends StatefulWidget {
  const InputSchedule({
    Key? key,
  }) : super(key: key);

  @override
  State<InputSchedule> createState() => _InputScheduleState();
}

class _InputScheduleState extends State<InputSchedule> {
  List<String> teachers = ['Getting Teachers'];

  @override
  Widget build(BuildContext context) {
    Object? teacherValue = teachers.first.toString();
    Object? classValue = 'Choose Class';
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    DataService(firebaseFirestore)
        .getClasses(teacherName: 'Mrs. Letang')
        .then((value) {
      //print(value);
    });

    DataService(firebaseFirestore).getTeacherData().then((value) {
      setState(() {
        teachers = value!;
      });
    });

    return Scaffold(
      appBar: const TopBar(title: 'Input Your Schedule'),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Period 1'),
                  DropdownButtonFormField(
                    value: teacherValue,
                    onChanged: (Object? newValue) {
                      setState(() {
                        teacherValue = newValue.toString();
                      });
                    },
                    items:
                        teachers.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  DropdownButtonFormField(
                    value: classValue,
                    onChanged: (Object? newValue) {
                      setState(() {
                        classValue = newValue.toString();
                      });
                    },
                    items: <String>[
                      'Choose Class',
                      'Algebra 2',
                      'Algebra 2 Honors',
                      'Pre-Calc',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

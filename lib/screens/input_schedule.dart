import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:school_app/data_service.dart';

import 'package:school_app/widgets/app_bar.dart';
import 'package:school_app/widgets/input_card.dart';

class InputSchedule extends StatefulWidget {
  const InputSchedule({
    Key? key,
  }) : super(key: key);

  @override
  State<InputSchedule> createState() => _InputScheduleState();
}

class _InputScheduleState extends State<InputSchedule> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<String> selectedTeachers = [
    'Select Teacher',
    'Select Teacher',
    'Select Teacher',
    'Select Teacher',
    'Select Teacher',
    'Select Teacher',
    'Select Teacher'
  ];
  List<String> selectedClasses = [
    'Please select a teacher first',
    'Please select a teacher first',
    'Please select a teacher first',
    'Please select a teacher first',
    'Please select a teacher first',
    'Please select a teacher first',
    'Please select a teacher first',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(title: 'Input Your Schedule'),
      body: Form(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                cacheExtent: 1080,
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                itemCount: 7,
                itemBuilder: (context, index) => InputCard(
                  period: index,
                  classChange: (String selection) {
                    selectedClasses[index] = selection;
                  },
                  teacherChange: (String selection) {
                    selectedTeachers[index] = selection;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  if (selectedTeachers.contains('Select Teacher') ||
                      (selectedClasses
                              .contains('Please select a teacher first') ||
                          selectedClasses.contains('Select Class'))) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content:
                          Text('Please fill in all fields before submitting'),
                      duration: Duration(seconds: 5),
                    ));
                  } else {
                    DataService(firebaseFirestore).sendData(
                        teachers: selectedTeachers, classes: selectedClasses);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Submit'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

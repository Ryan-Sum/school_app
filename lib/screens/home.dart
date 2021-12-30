import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:school_app/data_service.dart';
import 'package:school_app/widgets/class_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  bool value = false;
  Map studentClasses = {
    'Period 4': ['Loading', 'Loading'],
    'Period 3': ['Loading', 'Loading'],
    'Period 7': ['Loading', 'Loading'],
    'Period 2': ['Loading', 'Loading'],
    'Period 6': ['Loading', 'Loading'],
    'Period 1': ['Loading', 'Loading'],
    'Period 5': ['Loading', 'Loading']
  };

  @override
  void initState() {
    super.initState();
    DataService(firebaseFirestore).hasSchedule().then((hasSchedule) {
      if (value != hasSchedule) {
        setState(() {
          value = hasSchedule;
        });
      }
    });
    DataService(firebaseFirestore).getStudentClasses().then((value) {
      setState(() {
        studentClasses = value;
        print(studentClasses);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Hello');
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 48, 16, 0),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/inputSchedule'),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text(value ? 'Edit Your Schedule' : 'Input Your Schedule'),
                    const SizedBox(
                      width: 165.0,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16.0,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: 7,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.7),
              itemBuilder: (context, index) {
                List classData = [];
                studentClasses.forEach((key, value) {
                  if (key == 'Period ${index + 1}') {
                    classData = value;
                  }
                });
                print(classData);
                return ClassCard(
                  teacher: classData.elementAt(0).toString(),
                  className: classData.elementAt(1).toString(),
                  period: (index + 1),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

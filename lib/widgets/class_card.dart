// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:school_app/screens/message.dart';

class ClassCard extends StatefulWidget {
  final String teacher;
  final String className;
  final int period;

  const ClassCard({
    Key? key,
    required this.teacher,
    required this.className,
    required this.period,
  }) : super(key: key);

  @override
  State<ClassCard> createState() => _ClassCardState();
}

class _ClassCardState extends State<ClassCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            height: 25.0,
            constraints: const BoxConstraints.expand(),
            child: Center(
                child: Text(
              'Period ${widget.period}',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            )),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 252, 163, 17),
              borderRadius: BorderRadius.circular(4.0),
              boxShadow: const [
                BoxShadow(
                    color: Color(0xFFa4a7ab),
                    offset: Offset(0, 2),
                    blurRadius: 5,
                    blurStyle: BlurStyle.inner)
              ],
            ),
          ),
        ),
        Card(
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => MessageScreen(
                    teacher: widget.teacher,
                    className: widget.className,
                  ),
                ),
              );
            },
            title: Text(widget.className),
            subtitle: Text(widget.teacher),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16.0,
            ),
          ),
        )
      ],
    );
  }
}

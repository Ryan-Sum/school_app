import 'package:flutter/material.dart';

class EventWidget extends StatefulWidget {
  final String event;

  const EventWidget({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(widget.event),
            ],
          ),
        ),
      ),
    );
  }
}

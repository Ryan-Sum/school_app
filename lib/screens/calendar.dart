import 'package:flutter/material.dart';
import 'package:school_app/models/event.dart';
import 'package:school_app/widgets/event_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  Map selectedEvents = {};
  @override
  void initState() {
    selectedEvents = {
      DateTime.utc(2022, 1, 4): [Event('ALL DAY: Students Return From Break')],
      DateTime.utc(2022, 1, 5): [Event('ALL DAY - Club Day')],
      DateTime.utc(2022, 1, 25): [Event('4:30 - 5:30 PM: Tennis Tryouts')],
      DateTime.utc(2022, 2, 4): [
        Event('3:30 - 4:30 PM Spring Sports Pep Rally')
      ],
      DateTime.utc(2022, 2, 9): [Event('ALL DAY: Club Day')],
      DateTime.utc(2022, 2, 21): [Event('ALL DAY: Presidents Day (No School)')],
      DateTime.utc(2022, 3, 2): [Event('ALL DAY: Club Day')],
      DateTime.utc(2022, 3, 7): [Event('ALL DAY: No School')],
      DateTime.utc(2022, 3, 11): [Event('ALl DAY: End of Quarter')],
      DateTime.utc(2022, 3, 14): [Event('ALL DAY: Spring Break (No School)')],
      DateTime.utc(2022, 3, 15): [Event('ALL DAY: Spring Break (No School)')],
      DateTime.utc(2022, 3, 16): [Event('ALL DAY: Spring Break (No School)')],
      DateTime.utc(2022, 3, 17): [Event('ALL DAY: Spring Break (No School)')],
      DateTime.utc(2022, 3, 18): [Event('ALL DAY: Spring Break (No School)')],
      DateTime.utc(2022, 3, 21): [Event('ALL DAY: No School')],
      DateTime.utc(2022, 4, 6): [Event('ALL DAY: Club Day')],
      DateTime.utc(2022, 5, 23): [Event('ALL DAY: Semester Exams')],
      DateTime.utc(2022, 5, 24): [Event('ALL DAY: Semester Exams')],
      DateTime.utc(2022, 5, 25): [Event('ALL DAY: Semester Exams')],
      DateTime.utc(2022, 5, 26): [Event('ALL DAY: Semester Exams')],
      DateTime.utc(2022, 5, 27): [
        Event('ALL DAY: Semester Exams'),
        Event('ALL DAY: Last Day of School 🎉')
      ],
    };
    super.initState();
  }

  List<Event> _getEventsFromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64.0),
      child: Column(
        children: [
          TableCalendar(
            eventLoader: (date) => _getEventsFromDay(date),
            calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                    color: Colors.amber[200], shape: BoxShape.circle),
                selectedDecoration: const BoxDecoration(
                    color: Colors.amber, shape: BoxShape.circle)),
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // update `_focusedDay` here as well
              });
            },
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            firstDay: DateTime.utc(2021, 8, 10),
            lastDay: DateTime.utc(2022, 5, 27),
            focusedDay: _focusedDay,
          ),
          ..._getEventsFromDay(_selectedDay!).map((e) => EventWidget(
                event: e.title,
              ))
        ],
      ),
    );
  }
}

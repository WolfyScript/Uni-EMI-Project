import 'dart:collection';

import 'package:first_flutter_project/event.dart';
import 'package:first_flutter_project/navbar/nav_sidebar.dart';
import 'package:first_flutter_project/utils.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return CalendarState();
  }
}

class CalendarState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDate = DateTime.utc(2023, 2, 8);
  DateTime _focusedDate = DateTime.utc(2023, 2, 8);
  final events = LinkedHashMap<DateTime, Event>(
    equals: (e0, e1) {
      return isSameDay(e0, e1);
    },
    hashCode: (key) {
      return key.day * 1000000 + key.month * 10000 + key.year;
    },
  )..addAll({
      DateTime.utc(2023, 1, 30): Event("paper"),
      DateTime.utc(2023, 2, 7): Event("bio"),
      DateTime.utc(2023, 2, 16): Event("rest"),
      DateTime.utc(2023, 2, 20): Event("yellow"),
      DateTime.utc(2023, 2, 23): Event("bulky_waste"),
    });

  List<Event> _getEvents(DateTime day) {
    Event? event = events[day];
    if (event != null) return [event];
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavSidebar(),
      appBar: AppBar(
        title: const Text("Kalender"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TableCalendar(
                calendarFormat: _calendarFormat,
                focusedDay: _focusedDate,
                firstDay: DateTime.utc(2010),
                lastDay: DateTime.utc(2030),
                eventLoader: (day) {
                  return _getEvents(day);
                },
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDate, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDate = selectedDay;
                    _focusedDate = focusedDay;
                  });
                },
                onPageChanged: (focusedDay) {
                  _focusedDate = focusedDay;
                },
                calendarBuilders: CalendarBuilders<Event>(
                  markerBuilder: (context, day, events) {
                    if (events.isEmpty) return null;
                    Event event = events.first;
                    if (day != _selectedDate) {
                      return Center(
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                            color: MaterialColor(
                                event.type.color.value, const {}),
                          ),
                          child: Center(
                            child: Text(day.day.toString()),
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 4),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                            color: MaterialColor(
                                event.type.color.value, const {}),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text("Termin Hinzufügen"),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
              child: Wrap(
                spacing: 64,
                runSpacing: 8,
                alignment: WrapAlignment.spaceBetween,
                children:
                    eventTypes.values.map((e) => e.buildChip(context)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

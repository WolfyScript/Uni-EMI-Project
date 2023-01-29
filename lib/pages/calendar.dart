import 'dart:collection';

import 'package:uni_emi_muell_guard/dummy_data.dart';
import 'package:uni_emi_muell_guard/event.dart';
import 'package:uni_emi_muell_guard/navbar/nav_sidebar.dart';
import 'package:uni_emi_muell_guard/utils.dart';
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

  final disabledEvents = HashSet(
    hashCode: (p0) => p0.hashCode,
    equals: (p0, p1) => p0 == p1,
  );

  List<Event> _getEvents(DateTime day) {
    Event? event = events[day];
    if (event != null) return [event];
    return [];
  }

  void updateEvents() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavSidebar(),
      appBar: AppBar(
        title: const Text("Kalender"),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TableCalendar(
                locale: 'de_DE',
                calendarFormat: _calendarFormat,
                focusedDay: _focusedDate,
                firstDay: DateTime.utc(2022),
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
                    if (disabledEvents.contains(event.type.id))
                      return Container();
                    if (day != _selectedDate) {
                      return Center(
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            color:
                                MaterialColor(event.type.color.value, const {}),
                          ),
                          child: Center(
                            child: Text(day.day.toString()),
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 40, left: 16, right: 16, bottom: 1),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            //borderRadius: const BorderRadius.all(Radius.circular(8)),
                            border: Border.all(color: Colors.black87, width: 1),
                            color:
                                MaterialColor(event.type.color.value, const {}),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
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
                children: eventTypes.values
                    .map((e) => buildChip(e, context))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildChip(EventType eventType, BuildContext context) {
    BorderSide borderSide = const BorderSide(
      color: Colors.black45,
      width: 2,
    );

    return InputChip(
      padding: const EdgeInsets.only(top: 2, right: 4, bottom: 2),
      label: Text(eventType.label),
      visualDensity: VisualDensity.comfortable,
      backgroundColor: const Color(0xffD9D9D9),
      selected: !disabledEvents.contains(eventType.id),
      onSelected: (value) {
        setState(() {
          if (value) {
            disabledEvents.remove(eventType.id);
          } else {
            disabledEvents.add(eventType.id);
          }
        });
      },
      avatar: CircleAvatar(
        backgroundColor: eventType.color,
        foregroundColor: eventType.color,
        child: Container(),
      ),
    );
  }
}

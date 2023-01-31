import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uni_emi_muell_guard/dialogs/add_event_type_dialog.dart';
import 'package:uni_emi_muell_guard/dialogs/calendar_day_events_overview_dialog.dart';
import 'package:uni_emi_muell_guard/dummy_data.dart';
import 'package:uni_emi_muell_guard/event.dart';
import 'package:uni_emi_muell_guard/navbar/nav_sidebar.dart';
import 'package:uni_emi_muell_guard/utils.dart';

import '../dialogs/add_event_dialog.dart';

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

  List<Event> _getEvents(DateTime day) {
    List<Event>? eventList = events[day];
    if (eventList != null) return eventList;
    return [];
  }

  void updateEvents() {}

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();

    return Scaffold(
      drawer: const NavSidebar(),
      appBar: AppBar(
        title: const Text("Kalender"),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 16,
          ),
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TableCalendar(
                locale: 'de_DE',
                availableCalendarFormats: const {
                  CalendarFormat.month: "Monat",
                },
                calendarFormat: _calendarFormat,
                focusedDay: _focusedDate,
                firstDay: DateTime.utc(2022),
                lastDay: DateTime.utc(2030),
                eventLoader: (day) {
                  return _getEvents(day);
                },
                onDayLongPressed: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDate = selectedDay;
                    _focusedDate = focusedDay;
                  });
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DayEventsOverviewDialog(
                          selectedDay: selectedDay,
                          notify: () {
                            setState(() {});
                          });
                    },
                  );
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
                  todayBuilder: (context, day, focusedDay) {
                    return Center(
                      child: Container(
                        margin: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.7),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            day.day.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  selectedBuilder: (context, day, focusedDay) {
                    return Center(
                      child: Container(
                        margin: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            day.day.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  markerBuilder: (context, day, events) {
                    if (events.isEmpty) return null;
                    List<Event> enabledEvents = events
                        .where((element) =>
                            !hiddenEventTypes.contains(element.type))
                        .toList();
                    if (enabledEvents.isEmpty) {
                      return Container();
                    }
                    Event event = enabledEvents.first;
                    bool isToday = isSameDay(day, currentTime);
                    bool afterOrIsToday = !day.isBefore(currentTime) || isToday;

                    if (!isSameDay(day, _selectedDate) &&
                        !isToday &&
                        enabledEvents.length <= 1) {
                      return Center(
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            color: MaterialColor(
                                event.type.color
                                    .withOpacity(afterOrIsToday ? 1 : 0.7)
                                    .value,
                                const {}),
                          ),
                          child: Center(
                            child: Text(day.day.toString()),
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                            top: 38,
                            left: 0,
                            right: 0,
                            bottom: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...enabledEvents.map<Widget>((e) {
                                return Container(
                                  height: double.infinity,
                                  width: 16,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black87),
                                    color: MaterialColor(
                                        e.type.color
                                            .withOpacity(
                                                afterOrIsToday ? 1 : 0.7)
                                            .value,
                                        const {}),
                                  ),
                                );
                              }),
                            ],
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
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AddEventDialog(
                        selectedDay: _selectedDate,
                        notify: () {
                          setState(() {});
                        },
                      );
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text("Termin Hinzufügen"),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
              child: Wrap(
                spacing: 16,
                runSpacing: 8,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  ...eventTypes.values
                      .map((e) => buildChip(e, context))
                      .toList(),
                  ActionChip(
                    visualDensity: VisualDensity.comfortable,
                    label: const Text("Hinzufügen",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AddEventTypeDialog(
                            notify: () {
                              setState(() {});
                            },
                          );
                        },
                      );
                    },
                    avatar: const Icon(Icons.add_circle_outline_rounded),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildChip(EventType eventType, BuildContext context) {
    return InputChip(
      padding: const EdgeInsets.only(top: 2, right: 4, bottom: 2),
      label: Text(
        eventType.label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      iconTheme: const IconThemeData(size: 18, color: Color(0xffD9D9D9)),
      visualDensity: VisualDensity.comfortable,
      backgroundColor: const Color(0xffD9D9D9),
      selected: !hiddenEventTypes.contains(eventType),
      onSelected: (value) {
        setState(() {
          if (value) {
            hiddenEventTypes.remove(eventType);
          } else {
            hiddenEventTypes.add(eventType);
          }
        });
      },
      onDeleted: () {
        setState(() {
          removeEventType(eventType);
        });
      },
      avatar: Container(
        decoration:
            BoxDecoration(color: eventType.color, shape: BoxShape.circle),
      ),
    );
  }
}

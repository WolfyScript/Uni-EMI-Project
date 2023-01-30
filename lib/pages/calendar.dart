import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uni_emi_muell_guard/dummy_data.dart';
import 'package:uni_emi_muell_guard/event.dart';
import 'package:uni_emi_muell_guard/navbar/nav_sidebar.dart';
import 'package:uni_emi_muell_guard/utils.dart';

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
                children: [
                  ...eventTypes.values
                      .map((e) => buildChip(e, context))
                      .toList(),
                  ActionChip(
                    visualDensity: VisualDensity.comfortable,
                    label: const Text("Hinzufügen",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: () {
                      showGeneralDialog(
                        context: context,
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return Dialog(
                            backgroundColor: Colors.white,
                            insetPadding: EdgeInsets.symmetric(
                                vertical: 24, horizontal: 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            child: SingleChildScrollView(
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                constraints: BoxConstraints.expand(
                                    width: 300, height: 400),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Abholart Hinzufügen",
                                      style: TextStyle(
                                        color: MaterialColor(
                                            Theme.of(context)
                                                .primaryColor
                                                .value,
                                            const {}),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    /*
                                    SlidePicker(
                                      pickerColor: Colors.green,
                                      enableAlpha: false,
                                      labelTypes: const [],
                                      onColorChanged: (value) {},
                                    )
                                     */
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: MaterialPicker(
                                          pickerColor: Colors.white,
                                          portraitOnly: true,
                                          enableLabel: true,
                                          onColorChanged: (value) {},
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    const TextField(
                                      decoration:
                                          InputDecoration(hintText: "Name"),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        OutlinedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text("Abbrechen")),
                                        ElevatedButton(
                                            onPressed: () {},
                                            child: const Text("Hinzufügen"))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                      /*
                      showCupertinoModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Center(
                            child: Container(
                              padding: EdgeInsets.all(16),
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  ElevatedButton(onPressed: () {
                                    showDialog(context: context, builder: (context) {
                                      return Container(child: Text("TEst Dialog"),);
                                    },);
                                  }, child: Text("Test"))
                                ],
                              )
                            ),
                          );
                        },
                      );

                       */
                    },
                    avatar: const Icon(Icons.add_circle_rounded),
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
    BorderSide borderSide = const BorderSide(
      color: Colors.black45,
      width: 2,
    );

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
      avatar: Container(
        decoration:
            BoxDecoration(color: eventType.color, shape: BoxShape.circle),
      ),
    );
  }
}

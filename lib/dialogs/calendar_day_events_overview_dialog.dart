import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uni_emi_muell_guard/dialogs/add_event_dialog.dart';
import 'package:uni_emi_muell_guard/dummy_data.dart';
import 'package:uni_emi_muell_guard/event.dart';
import 'package:uni_emi_muell_guard/utils.dart';

class DayEventsOverviewDialog extends StatefulWidget {
  final Function() notify;
  final DateTime selectedDay;

  const DayEventsOverviewDialog(
      {required this.selectedDay, required this.notify, super.key});

  @override
  State<StatefulWidget> createState() {
    return _DayEventsOverviewDialog(notify, selectedDay);
  }
}

class _DayEventsOverviewDialog extends State<DayEventsOverviewDialog> {
  final Function() notify;
  final DateTime selectedDay;

  _DayEventsOverviewDialog(this.notify, this.selectedDay);

  @override
  Widget build(BuildContext context) {
    List<Event> dayEvents = events[selectedDay] ?? [];

    Widget eventsElement = dayEvents.isEmpty
        ? const Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Center(
              child: Text("Keine Termine!"),
            ),
          )
        : Wrap(
      direction: Axis.vertical,
      runAlignment: WrapAlignment.start,
      alignment: WrapAlignment.start,
            children: [
              ...dayEvents.map((e) => buildChip(e.type, context)),
            ],
          );

    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        constraints: const BoxConstraints(maxHeight: 460),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Aktuelle Termine",
              style: TextStyle(
                  color: MaterialColor(
                      Theme.of(context).primaryColor.value, const {}),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(DateFormat('dd. MMMM yyyy', 'de_DE').format(selectedDay)),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: eventsElement,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Center(
              child: OutlinedButton(
                  onPressed: () {
                    showDialog(context: context, barrierColor: const Color(0x00000000), builder: (context) {
                      return AddEventDialog(selectedDay: selectedDay, notify: () {
                        setState(() {});
                        notify.call();
                      },);
                    },);
                  },
                  child: const Text("Termin Hinzufügen")),
            ),
            const SizedBox(
              height: 4,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    notify.call();
                  },
                  child: const Text("Zurück")),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildChip(EventType eventType, BuildContext context) {
    return Chip(
      padding: const EdgeInsets.only(top: 2, right: 4, bottom: 2),
      label: Text(
        eventType.label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      iconTheme: const IconThemeData(size: 18, color: Color(0xffD9D9D9)),
      visualDensity: VisualDensity.comfortable,
      backgroundColor: const Color(0xffD9D9D9),
      avatar: Container(
        decoration:
            BoxDecoration(color: eventType.color, shape: BoxShape.circle),
      ),
      onDeleted: () {
        setState(() {
          events.update(selectedDay, (value) {
            return value..removeWhere((element) => element.type == eventType);
          });
        });
      },
    );
  }
}

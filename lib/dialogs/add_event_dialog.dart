import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uni_emi_muell_guard/dummy_data.dart';
import 'package:uni_emi_muell_guard/event.dart';

import '../utils.dart';

class AddEventDialog extends StatefulWidget {

  final Function() notify;
  final DateTime selectedDay;

  const AddEventDialog({super.key, required this.selectedDay, required this.notify});

  @override
  State<StatefulWidget> createState() {
    return _AddEventDialogState(selectedDay, notify);
  }
}

class _AddEventDialogState extends State<AddEventDialog> {

  final Function() notify;
  EventType? selectedType;
  final DateTime selectedDay;

  _AddEventDialogState(this.selectedDay, this.notify);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(maxHeight: 460),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Termin Hinzufügen",
              style: TextStyle(
                  color: MaterialColor(
                      Theme.of(context).primaryColor.value, const {}),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            Text("Datum: ${DateFormat('dd. MMMM yyyy','de_DE').format(selectedDay)}"),
            const SizedBox(height: 16,),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.spaceAround,
                  children: [
                    ...eventTypes.values
                        .map((e) => buildChip(e, context))
                        .toList()

                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Abbrechen")),
                ElevatedButton(
                    onPressed: () {
                      if (selectedType == null) {
                        return;
                      }
                      setState(() {
                        events.update(selectedDay, (value) {
                            return value..add(Event(selectedType!.id));
                        }, ifAbsent: () {
                          return [Event(selectedType!.id)];
                        },);
                      });

                      Navigator.of(context).pop();
                      notify.call();
                    },
                    child: const Text("Hinzufügen"))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildChip(EventType eventType, BuildContext context) {
    return ChoiceChip(
      padding: const EdgeInsets.only(top: 2, right: 4, bottom: 2),
      label: Text(
        eventType.label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      iconTheme: const IconThemeData(size: 18, color: Color(0xffD9D9D9)),
      visualDensity: VisualDensity.comfortable,
      backgroundColor: const Color(0xffD9D9D9),
      selected: eventType == selectedType,
      onSelected: (value) {
        setState(() {
          selectedType = value ? eventType : null;
        });
      },
      avatar: Container(
        decoration:
        BoxDecoration(color: eventType.color, shape: BoxShape.circle),
      ),
    );
  }
}

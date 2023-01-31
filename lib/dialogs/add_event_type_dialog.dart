import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:uni_emi_muell_guard/utils.dart';

class AddEventTypeDialog extends StatefulWidget {

  final Function() notify;

  const AddEventTypeDialog({required this.notify, super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddEventTypeDialogState(notify);
  }
}

class _AddEventTypeDialogState extends State<AddEventTypeDialog> {
  Color pickedColor = Colors.black87;
  String? name = "";
  final Function() notify;

  _AddEventTypeDialogState(this.notify);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          constraints: const BoxConstraints.expand(width: 300, height: 400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Abfallart Hinzufügen",
                style: TextStyle(
                    color: MaterialColor(
                        Theme.of(context).primaryColor.value, const {}),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
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
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    clipBehavior: Clip.antiAlias,
                    child: MaterialPicker(
                      pickerColor: pickedColor,
                      portraitOnly: true,
                      enableLabel: true,
                      onColorChanged: (value) {
                        setState(() {
                          pickedColor = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Name",
                  errorText: name == null || name!.isEmpty
                      ? "Bitte gebe ein Namen ein!"
                      : null,
                ),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
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
                        if (name == null || name!.isEmpty) {
                          setState(() {});
                          return;
                        }
                        registerEventType(EventType("custom_${DateTime.now().millisecondsSinceEpoch}", name!, pickedColor));
                        Navigator.of(context).pop();
                        notify.call();
                      }, child: const Text("Hinzufügen"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

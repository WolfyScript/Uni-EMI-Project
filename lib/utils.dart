import 'dart:collection';

import 'package:flutter/material.dart';

class EventType {
  final String label;
  final String id;
  final Color color;

  EventType(this.id, this.label, this.color);

  Widget buildChip(BuildContext context) {
    BorderSide borderSide = const BorderSide(color: Colors.black45, width: 2,);

    return Chip(
      padding: const EdgeInsets.only(top: 2, right: 4, bottom: 2),
      label: Text(label),
      visualDensity: VisualDensity.comfortable,
      backgroundColor: const Color(0xffD9D9D9),
      avatar: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border(
            bottom: borderSide,
            right: borderSide,
            left: borderSide,
            top: borderSide,
          ),
        ),
      ),
    );
  }
}

final eventTypes = LinkedHashMap<String, EventType>(
  hashCode: (key) {
    return key.hashCode;
  },
  equals: (p0, p1) {
    return p0 == p1;
  },
  isValidKey: (p0) {
    return true;
  },
);

void registerEventType(EventType type) {
  eventTypes.update(
    type.id,
    (value) => type,
    ifAbsent: () => type,
  );
}

void registerEventTypes() {
  registerEventType(EventType("paper", "Papier", const Color(0xff6578DB)));
  registerEventType(EventType("bio", "Biomüll", const Color(0xff88563A)));
  registerEventType(EventType("rest", "Restmüll", const Color(0xff494949)));
  registerEventType(EventType("yellow", "Gelber Sack",const Color(0xffF3E568)));
  registerEventType(EventType("bulky_waste", "Sperrmüll", const Color(0xffF47D7D)));
}

EventType? getEventType(String id) {
  return eventTypes[id];
}

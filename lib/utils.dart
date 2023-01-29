import 'dart:collection';

import 'package:flutter/material.dart';

class EventType {
  final String label;
  final String id;
  final Color color;

  EventType(this.id, this.label, this.color);

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

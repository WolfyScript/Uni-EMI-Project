import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

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

final customMarkdownStyleSheet = MarkdownStyleSheet(
  textScaleFactor: 1.04,
  h1Padding: const EdgeInsets.symmetric(vertical: 16),
  h1: const TextStyle(fontWeight: FontWeight.w800),
  h2Padding: const EdgeInsets.symmetric(vertical: 8),
  h2: const TextStyle(fontWeight: FontWeight.w700),
  h3Padding: const EdgeInsets.symmetric(vertical: 6),
  h3: const TextStyle(fontWeight: FontWeight.w600),
  h4Padding: const EdgeInsets.symmetric(vertical: 4),
  h4: const TextStyle(fontWeight: FontWeight.w600),
  h5Padding: const EdgeInsets.symmetric(vertical: 2),
  h5: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xff64748B)),
  h6Padding: const EdgeInsets.symmetric(vertical: 1),
  h6: const TextStyle(fontWeight: FontWeight.w500, color: Color(0xff64748B)),
);
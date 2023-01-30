import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class EventType {
  final String label;
  final String id;
  final Color color;

  EventType(this.id, this.label, this.color);

}

enum BaseEventType {

  residualWaste("residual_waste"),
  yellowBag("yellow_waste"),
  paper("paper"),
  organicWaste("organic_waste"),
  bulkyWaste("bulky_waste");

  final String id;

  const BaseEventType(this.id);

}

final disabledEventTypes = HashSet<EventType>(
  hashCode: (p0) => p0.id.hashCode,
  equals: (p0, p1) => p0.id == p1.id,
);

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
  registerEventType(EventType(BaseEventType.paper.id, "Papier", const Color(0xff6578DB)));
  registerEventType(EventType(BaseEventType.organicWaste.id, "Biomüll", const Color(0xff88563A)));
  registerEventType(EventType(BaseEventType.residualWaste.id, "Restmüll", const Color(0xff494949)));
  registerEventType(EventType(BaseEventType.yellowBag.id, "Gelber Sack",const Color(0xffF3E568)));
  registerEventType(EventType(BaseEventType.bulkyWaste.id, "Sperrmüll", const Color(0xffF47D7D)));
}

void removeEventType() {


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
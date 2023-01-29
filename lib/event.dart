import 'package:uni_emi_muell_guard/utils.dart';

class Event {

  late final EventType type;

  Event(String typeId) : assert(typeId != null) {
    EventType? type = getEventType(typeId);
    if (type == null) {
      this.type = eventTypes.values.first;
    } else {
      this.type = type;
    }
  }

  @override
  String toString() => type.id;

}

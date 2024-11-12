import 'package:event_manager/event/event_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<EventModal> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    EventModal item = appointments!.elementAt(index);
    return item.startTime;
  }

  @override
  DateTime getEndTime(int index) {
    EventModal item = appointments!.elementAt(index);
    return item.endTime;
  }

  @override
  String getSubject(int index) {
    EventModal item = appointments!.elementAt(index);
    return item.subject;
  }

  @override
  String? getNotes(int index) {
    EventModal item = appointments!.elementAt(index);
    return item.notes;
  }

  @override
  bool isAllDay(int index) {
    EventModal item = appointments!.elementAt(index);
    return item.isAllDay;
  }

  @override
  String? getRecurrencuRule(int index) {
    EventModal item = appointments!.elementAt(index);
    return item.recurremceRule;
  }
  
  @override
  Color getColor(int index) {
    EventModal item = appointments!.elementAt(index);
    return item.isAllDay ? const Color(0xFF0F8664):super.getColor(index);
  }

}

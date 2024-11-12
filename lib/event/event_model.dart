// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EventModal {
  String? id;
  DateTime startTime;
  DateTime endTime;
  bool isAllDay;
  String subject;
  String? notes;
  String? recurremceRule;
  EventModal({
    this.id,
    required this.startTime,
    required this.endTime,
    this.isAllDay = false,
     this.subject = '',
    this.notes,
    this.recurremceRule,
  });

  EventModal copyWith({
    String? id,
    DateTime? startTime,
    DateTime? endTime,
    bool? isAllDay,
    String? subject,
    String? notes,
    String? recurremceRule,
  }) {
    return EventModal(
      id: id ?? this.id,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      isAllDay: isAllDay ?? this.isAllDay,
      subject: subject ?? this.subject,
      notes: notes ?? this.notes,
      recurremceRule: recurremceRule ?? this.recurremceRule,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'startTime': startTime.millisecondsSinceEpoch,
      'endTime': endTime.millisecondsSinceEpoch,
      'isAllDay': isAllDay,
      'subject': subject,
      'notes': notes,
      'recurremceRule': recurremceRule,
    };
  }

  factory EventModal.fromMap(Map<String, dynamic> map) {
    return EventModal(
      id: map['id'] != null ? map['id'] as String : null,
      startTime: DateTime.fromMillisecondsSinceEpoch(map['startTime'] as int),
      endTime: DateTime.fromMillisecondsSinceEpoch(map['endTime'] as int),
      isAllDay: map['isAllDay'] as bool,
      subject: map['subject'] as String,
      notes: map['notes'] != null ? map['notes'] as String : null,
      recurremceRule: map['recurremceRule'] != null ? map['recurremceRule'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModal.fromJson(String source) => EventModal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EventModal(id: $id, startTime: $startTime, endTime: $endTime, isAllDay: $isAllDay, subject: $subject, notes: $notes, recurremceRule: $recurremceRule)';
  }

  @override
  bool operator ==(covariant EventModal other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.startTime == startTime &&
      other.endTime == endTime &&
      other.isAllDay == isAllDay &&
      other.subject == subject &&
      other.notes == notes &&
      other.recurremceRule == recurremceRule;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      startTime.hashCode ^
      endTime.hashCode ^
      isAllDay.hashCode ^
      subject.hashCode ^
      notes.hashCode ^
      recurremceRule.hashCode;
  }
}
extension ExtEvenModel on EventModal{
  String get formatedStartTimeString => 
  '${startTime.hour}:${startTime.minute},${startTime.day} / ${startTime.month}/${startTime.year}';
  String get formatedEndTimeString => 
  '${endTime.hour}:${endTime.minute},${endTime.day} / ${endTime.month}/${endTime.year}';
}
import 'package:event_manager/event/event_model.dart';
import 'package:localstore/localstore.dart';
import 'package:event_manager/event/event_model.dart';
class EventService {
  final db = Localstore.getInstance(useSupportDir: true);

  final path = 'events';

  Future<List<EventModal>> getAllEvents() async {
    final eventsMap = await db.collection(path).get();

    if (eventsMap != null) {
      return eventsMap.entries.map((entry) {
        final eventData = entry.value as Map<String, dynamic>;
        if (!eventData.containsKey('id')) {
          eventData['id'] = entry.key.split('/').last;
        }
        return EventModal.fromMap(eventData);
      }).toList();
    }
    return [];
  }

  // hàm lưu sự kiện vào localstore
  Future<void> saveEvent(EventModal item) async {
    // nếu id không tồn tại, tạo mới và lấy id ngẫu nhiên
    item.id ??= db.collection(path).doc().id;
    await db.collection(path).doc(item.id).set(item.toMap());
  }

  // hàm xóa một sự kiện từ localstore
  Future<void> deletaEven(EventModal item) async {
    await db.collection(path).doc(item.id).delete();
  }
}

import '../../domain/entities/queue_entity.dart';
import 'json_to_order.dart';

class JsonToQueue {
  static QueueEntity fromMap(dynamic json) {
    return QueueEntity(
      id: json['id'],
      title: json['title'],
      abbr: json['abbr'],
      priority: json['priority'],
      orders: json.containsKey('orders')
          ? (json['orders'] as List).map((e) => JsonToOrder.fromMap(e)).toList()
          : [],
    );
  }

  static Map<String, dynamic> toMap(QueueEntity queue) {
    return {
      'id': queue.id,
      'title': queue.title,
      'abbr': queue.abbr,
      'priority': queue.priority,
      'orders': queue.orders.map((order) => JsonToOrder.toMap(order)).toList(),
    };
  }
}

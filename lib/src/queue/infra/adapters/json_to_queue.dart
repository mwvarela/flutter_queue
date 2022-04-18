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
}

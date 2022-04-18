import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_queue/src/queue/domain/value_objects/order.dart';
import 'package:flutter_queue/src/queue/infra/adapters/json_to_queue.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('json to queue ...', () {
    final queue = JsonToQueue.fromMap({
      'id': 'asdf',
      'title': 'Exames',
      'abbr': 'EX',
      'priority': 3,
      'orders': [
        {
          'id': 'asdf',
          'position': 1,
          'timestamp': '2022-04-18 16:53:30',
          'status': 'attending',
        }
      ],
    });

    expect(queue, isA<QueueEntity>());
    expect(queue.title, 'Exames');
    expect(queue.priority, 3);
    expect(queue.orders[0].status, OrderStatus.attending);
  });
}

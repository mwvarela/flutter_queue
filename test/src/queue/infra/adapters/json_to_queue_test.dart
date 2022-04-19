import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_queue/src/queue/domain/value_objects/order.dart';
import 'package:flutter_queue/src/queue/infra/adapters/json_to_queue.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks/mocks.dart';

void main() {
  test('json to queue fromMap', () {
    final queue = JsonToQueue.fromMap(queueEntityMap);

    expect(queue, isA<QueueEntity>());
    expect(queue.title, 'Exames');
    expect(queue.priority, 3);
    expect(queue.orders[0].status, OrderStatus.attending);
  });

  test('json to queue toMap', () {
    final queue = JsonToQueue.toMap(queueEntityMock);

    expect(queue['title'], 'Exames');
    expect(queue['priority'], 3);
    expect(queue['orders'][0]['status'], 'attending');
  });
}

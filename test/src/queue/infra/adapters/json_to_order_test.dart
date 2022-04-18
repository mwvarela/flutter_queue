import 'package:flutter_queue/src/queue/domain/value_objects/order.dart';
import 'package:flutter_queue/src/queue/infra/adapters/json_to_order.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('json to order ...', () {
    final order = JsonToOrder.fromMap(
      {
        'id': 'asdf',
        'position': 1,
        'timestamp': '2022-04-18 16:53:30',
        'status': 'attending',
      },
    );

    expect(order, isA<Order>());
    expect(order.status, OrderStatus.attending);
  });
}

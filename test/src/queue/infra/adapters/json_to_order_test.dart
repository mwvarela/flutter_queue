import 'package:flutter_queue/src/queue/domain/value_objects/order.dart';
import 'package:flutter_queue/src/queue/infra/adapters/json_to_order.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks/mocks.dart';

void main() {
  test('json to order fromMap', () {
    final order = JsonToOrder.fromMap(orderMap);

    expect(order, isA<Order>());
    expect(order.status, OrderStatus.attending);
  });

  test('json to order toMap', () {
    final map = JsonToOrder.toMap(orderEntityMock);
    expect(map['id'], 'FrDwSgH');
    expect(map['position'], 1);
  });
}

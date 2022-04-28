import 'package:flutter/cupertino.dart';
import 'package:flutter_queue/src/queue/domain/usecases/generate_order.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks/mocks.dart';

void main() {
  test('generate order', () {
    final usecase = GenerateOrder();
    final entity = queueEntityMock;
    final result = usecase.call(entity);
    expect(result.orders.length, 2);
    expect(result.orders.last.id, '0002');
    expect(result.orders.last.position, 2);
  });
}

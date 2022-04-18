import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_queue/src/queue/infra/repositories/queue_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mocks.dart';

void main() {
  test('queue repository ...', () {
    final datasource = IQueueDatasourceMock();
    when((() => datasource.getAllQueues()))
        .thenAnswer((_) => Stream.value([entitiMap]));
    final repository = QueueRepository(datasource);
    final result = repository.getAllQueues();

    expect(result, emits(isA<List<QueueEntity>>()));
  });
}

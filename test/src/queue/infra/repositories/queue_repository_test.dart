import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_queue/src/queue/infra/adapters/json_to_queue.dart';
import 'package:flutter_queue/src/queue/infra/repositories/queue_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mocks.dart';

void main() {
  test('queue repository getAllQueues', () {
    final datasource = IQueueDatasourceMock();
    when((() => datasource.getAllQueues())).thenAnswer((_) => Stream.value([]));
    final repository = QueueRepository(datasource);
    final result = repository.getAllQueues();

    expect(result, emits(isA<List<QueueEntity>>()));
  });

  test('queue repository addQueue', () {
    final datasource = IQueueDatasourceMock();
    final map = JsonToQueue.toMap(queueEntityMock);
    when((() => datasource.addQueue(map))).thenAnswer((_) => Future.value());
    final repository = QueueRepository(datasource);

    expect(repository.addQueue(queueEntityMock), completes);
  });
}

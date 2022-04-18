import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_queue/src/queue/domain/repositories/queue_repository.dart';
import 'package:flutter_queue/src/queue/domain/usecases/get_all_queues.dart';
import 'package:flutter_queue/src/queue/infra/datasource/queue_datasource.dart';
import 'package:mocktail/mocktail.dart';

class IQueueRepositoryMock extends Mock implements IQueueRepository {}

class QueueEntityMock extends Mock implements QueueEntity {}

class IGetAllQueuesMock extends Mock implements IGetAllQueues {}

class IQueueDatasourceMock extends Mock implements IQueueDatasource {}

final entitiMap = {
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
};

import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_queue/src/queue/domain/repositories/queue_repository.dart';
import 'package:flutter_queue/src/queue/domain/usecases/add_new_queue.dart';
import 'package:flutter_queue/src/queue/domain/usecases/get_all_queues.dart';
import 'package:flutter_queue/src/queue/domain/usecases/remove_queue.dart';
import 'package:flutter_queue/src/queue/domain/value_objects/order.dart';
import 'package:flutter_queue/src/queue/infra/datasource/queue_datasource.dart';
import 'package:mocktail/mocktail.dart';

class IQueueRepositoryMock extends Mock implements IQueueRepository {}

class QueueEntityMock extends Mock implements QueueEntity {}

class IGetAllQueuesMock extends Mock implements IGetAllQueues {}

class IAddNewQueueMock extends Mock implements IAddNewQueue {}

class IRemoveQueueMock extends Mock implements IRemoveQueue {}

class IQueueDatasourceMock extends Mock implements IQueueDatasource {}

final queueEntityMock = QueueEntity(
  id: 'FrDwSgH',
  title: 'Exames',
  abbr: 'EX',
  priority: 3,
  orders: [orderEntityMock],
);

final queueEntityMap = {
  'id': 'FrDwSgH',
  'title': 'Exames',
  'abbr': 'EX',
  'priority': 3,
  'orders': [
    {
      'id': 'asdf',
      'position': 1,
      'timestamp': '2022-04-18 16:53:30',
      'status': 'attending',
    },
    {
      'id': 'freds',
      'position': 2,
      'timestamp': '2022-04-19 10:00:30',
      'status': 'attending',
    }
  ],
};

final orderEntityMock = Order(
  id: 'asdf',
  position: 1,
  timestamp: DateTime.parse('2022-04-18 16:53:30'),
  status: OrderStatus.attending,
);

final orderMap = {
  'id': 'asdf',
  'position': 1,
  'timestamp': '2022-04-18 16:53:30',
  'status': 'attending',
};

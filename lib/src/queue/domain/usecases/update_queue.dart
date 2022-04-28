import 'package:flutter_queue/src/queue/domain/repositories/queue_repository.dart';

import '../entities/queue_entity.dart';

abstract class IUpdateQueue {
  Future<void> call(QueueEntity queueEntity);
}

class UpdateQueue implements IUpdateQueue {
  final IQueueRepository repository;

  UpdateQueue(this.repository);

  @override
  Future<void> call(QueueEntity queueEntity) async {
    await repository.updateQueue(queueEntity);
  }
}

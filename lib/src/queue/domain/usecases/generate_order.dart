import '../entities/queue_entity.dart';
import '../value_objects/order.dart';

abstract class IGenerateOrder {
  QueueEntity call(QueueEntity queueEntity);
}

class GenerateOrder implements IGenerateOrder {
  @override
  QueueEntity call(QueueEntity queueEntity) {
    final totalOrders = queueEntity.orders.length;
    final position = totalOrders + 1;
    final order = Order(
      id: _generateId(position),
      position: position,
      timestamp: DateTime.now(),
      status: OrderStatus.waiting,
    );

    queueEntity.orders.add(order);

    return queueEntity;
  }

  String _generateId(int id) {
    return '$id'.padLeft(4, '0');
  }
}

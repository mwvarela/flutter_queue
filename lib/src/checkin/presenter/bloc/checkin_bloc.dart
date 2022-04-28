import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../queue/domain/entities/queue_entity.dart';
import '../../../queue/domain/usecases/generate_order.dart';
import '../../../queue/domain/usecases/get_all_queues.dart';
import '../../../queue/domain/usecases/update_queue.dart';
import '../../../queue/domain/value_objects/order.dart';

part 'checkin_event.dart';
part 'checkin_state.dart';

class CheckinBloc extends Bloc<CheckinEvent, CheckinState> {
  final IGetAllQueues getAllQueues;
  final IGenerateOrder generateOrder;
  final IUpdateQueue updateQueue;
  CheckinBloc(
    this.getAllQueues,
    this.generateOrder,
    this.updateQueue,
  ) : super(CheckinInitialState()) {
    on<FetchAllQueuesEvent>(_fetchAllQueuesEvent);
    on<GenerateOrderEvent>(_generateOrderEvent);
  }

  Future<void> _fetchAllQueuesEvent(
    FetchAllQueuesEvent event,
    Emitter<CheckinState> emit,
  ) async {
    await emit.onEach<List<QueueEntity>>(
      getAllQueues.call(),
      onData: (data) {
        emit(CheckinSuccessState(data));
      },
    );
  }

  FutureOr<void> _generateOrderEvent(
    GenerateOrderEvent event,
    Emitter<CheckinState> emit,
  ) async {
    final queue = generateOrder.call(event.queue);
    final order = queue.orders.last;
    await updateQueue.call(queue);

    emit(CheckinOrderSuccessState(order));
  }
}

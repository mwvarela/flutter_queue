import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/queue_entity.dart';
import '../../domain/usecases/add_new_queue.dart';
import '../../domain/usecases/get_all_queues.dart';
import '../../domain/usecases/remove_queue.dart';

part 'queue_event.dart';
part 'queue_state.dart';

class QueueBloc extends Bloc<QueueEvent, QueueState> {
  final IGetAllQueues getAll;
  final IAddNewQueue addNew;
  final IRemoveQueue remove;

  QueueBloc(
    this.getAll,
    this.addNew,
    this.remove,
  ) : super(QueueInitialState()) {
    on<FetchQueuesEvent>(_fetchQueues, transformer: restartable());
    on<AddNewQueueEvent>(_addNewQueue, transformer: sequential());
    on<RemoveQueueEvent>(_removeQueue, transformer: sequential());
  }

  Future<void> _fetchQueues(
      FetchQueuesEvent event, Emitter<QueueState> emit) async {
    emit(QueueLoadingState());
    await emit.forEach<List<QueueEntity>>(
      getAll.call(),
      onData: (queues) => QueueLoadedState(queues),
      onError: (error, st) => QueueExeptionState(st.toString()),
    );
  }

  Future<void> _addNewQueue(
      AddNewQueueEvent event, Emitter<QueueState> emit) async {
    await addNew.call(event.queue);
  }

  Future<void> _removeQueue(
      RemoveQueueEvent event, Emitter<QueueState> emit) async {
    await remove.call(event.queue);
  }
}

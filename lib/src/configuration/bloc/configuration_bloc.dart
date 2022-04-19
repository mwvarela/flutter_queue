import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_queue/src/queue/domain/usecases/add_new_queue.dart';
import 'package:meta/meta.dart';

import '../../queue/domain/entities/queue_entity.dart';
import '../../queue/domain/usecases/get_all_queues.dart';

part 'configuration_event.dart';
part 'configuration_state.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  final IGetAllQueues getAllQueuesUsecase;
  final IAddNewQueue addNewQueuesUsecase;

  ConfigurationBloc(
    this.getAllQueuesUsecase,
    this.addNewQueuesUsecase,
  ) : super(ConfigurationInitial()) {
    on<FetchQueues>(_fetchQueues, transformer: restartable());
    on<AddNewQueue>(_addNewQueue, transformer: restartable());
  }

  Future<void> _fetchQueues(
      FetchQueues event, Emitter<ConfigurationState> emit) async {
    emit(ConfigurationLoading());
    await emit.forEach<List<QueueEntity>>(
      getAllQueuesUsecase.call(),
      onData: (queues) => ConfigurationLoaded(queues),
    );
  }

  Future<void> _addNewQueue(
      AddNewQueue event, Emitter<ConfigurationState> emit) async {
    await addNewQueuesUsecase.call(event.queue);
  }
}

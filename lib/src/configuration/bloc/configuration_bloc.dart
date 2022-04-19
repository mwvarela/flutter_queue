import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../queue/domain/entities/queue_entity.dart';
import '../../queue/domain/usecases/get_all_queues.dart';

part 'configuration_event.dart';
part 'configuration_state.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  final IGetAllQueues getAllqueuesUsecase;

  ConfigurationBloc(this.getAllqueuesUsecase) : super(ConfigurationInitial()) {
    on<FetchQueues>((event, emit) async {
      emit(ConfigurationLoading());
      await emit.forEach<List<QueueEntity>>(
        getAllqueuesUsecase.call(),
        onData: (queues) => ConfigurationLoaded(queues),
      );
    });
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../queue/domain/entities/queue_entity.dart';
import '../../queue/domain/usecases/get_all_queues.dart';

part 'configuration_event.dart';
part 'configuration_state.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  final IGetAllQueues getAllqueuesUsecase;
  late final StreamSubscription _sub;
  ConfigurationBloc(
    this.getAllqueuesUsecase,
  ) : super(ConfigurationInitial()) {
    _sub = getAllqueuesUsecase.call().listen((event) {
      add(AddQueue(event));
    });

    on<AddQueue>(
      (event, emit) => emit(ConfigurationLoaded(event.queue)),
    );
  }
  @override
  Future<void> close() async {
    await _sub.cancel();
    await super.close();
  }
}

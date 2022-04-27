part of 'queue_bloc.dart';

@immutable
abstract class QueueState {}

class QueueInitialState extends QueueState {}

class QueueLoadingState extends QueueState {}

class QueueLoadedState extends QueueState {
  final List<QueueEntity> queues;

  QueueLoadedState(this.queues);
}

class QueueExeptionState extends QueueState {
  final String message;

  QueueExeptionState(this.message);
}

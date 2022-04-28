part of 'checkin_bloc.dart';

@immutable
abstract class CheckinState {}

class CheckinInitialState extends CheckinState {}

class CheckinLoadingState extends CheckinState {}

class CheckinSuccessState extends CheckinState {
  final List<QueueEntity> queues;

  CheckinSuccessState(this.queues);
}

class CheckinOrderSuccessState extends CheckinState {
  final Order order;

  CheckinOrderSuccessState(this.order);
}

class CheckinExceptionState extends CheckinState {
  final String message;

  CheckinExceptionState(this.message);
}

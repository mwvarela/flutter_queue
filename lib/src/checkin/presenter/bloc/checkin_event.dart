part of 'checkin_bloc.dart';

@immutable
abstract class CheckinEvent {}

class FetchAllQueuesEvent implements CheckinEvent {}

class GenerateOrderEvent implements CheckinEvent {
  final QueueEntity queue;

  GenerateOrderEvent(this.queue);
}

part of 'queue_bloc.dart';

@immutable
abstract class QueueEvent {}

class FetchQueuesEvent implements QueueEvent {}

class AddNewQueueEvent implements QueueEvent {
  final QueueEntity queue;

  AddNewQueueEvent(this.queue);
}

class RemoveQueueEvent implements QueueEvent {
  final QueueEntity queue;

  RemoveQueueEvent(this.queue);
}

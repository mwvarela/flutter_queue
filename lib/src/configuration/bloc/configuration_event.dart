part of 'configuration_bloc.dart';

@immutable
abstract class ConfigurationEvent {}

class FetchQueues implements ConfigurationEvent {}

class AddQueue implements ConfigurationEvent {
  final List<QueueEntity> queue;

  AddQueue(this.queue);
}

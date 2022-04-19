part of 'configuration_bloc.dart';

@immutable
abstract class ConfigurationEvent {}

class FetchQueues implements ConfigurationEvent {}

class AddNewQueue implements ConfigurationEvent {
  final QueueEntity queue;

  AddNewQueue(this.queue);
}

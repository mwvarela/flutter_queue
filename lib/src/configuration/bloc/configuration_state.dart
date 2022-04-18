part of 'configuration_bloc.dart';

@immutable
abstract class ConfigurationState {}

class ConfigurationInitial extends ConfigurationState {}

class ConfigurationLoading extends ConfigurationState {}

class ConfigurationLoaded extends ConfigurationState {
  final List<QueueEntity> queues;

  ConfigurationLoaded(this.queues);
}

class ConfigurationExeption extends ConfigurationState {
  final String message;

  ConfigurationExeption(this.message);
}

part of 'configuration_bloc.dart';

@immutable
abstract class ConfigurationEvent {}

class FetchQueues implements ConfigurationEvent {}

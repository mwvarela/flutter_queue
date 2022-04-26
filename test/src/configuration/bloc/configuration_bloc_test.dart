import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_queue/src/configuration/bloc/configuration_bloc.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/mocks.dart';

void main() {
  blocTest<ConfigurationBloc, ConfigurationState>(
    'FetchQueues',
    build: () {
      final useCaseGetAllQueues = IGetAllQueuesMock();
      final useCaseAddNewQueue = IAddNewQueueMock();
      final useCaseRemoveQueue = IRemoveQueueMock();
      when(() => useCaseGetAllQueues.call())
          .thenAnswer((_) => Stream.value([]));
      return ConfigurationBloc(
          useCaseGetAllQueues, useCaseAddNewQueue, useCaseRemoveQueue);
    },
    act: (bloc) => bloc.add(FetchQueues()),
    expect: () => [
      isA<ConfigurationLoading>(),
      isA<ConfigurationLoaded>(),
    ],
  );

  blocTest<ConfigurationBloc, ConfigurationState>(
    'FetchQueues onError',
    build: () {
      final useCaseGetAllQueues = IGetAllQueuesMock();
      final useCaseAddNewQueue = IAddNewQueueMock();
      final useCaseRemoveQueue = IRemoveQueueMock();
      when(() => useCaseGetAllQueues.call())
          .thenAnswer((_) => Stream.error(Exception('Deu Erro')));
      return ConfigurationBloc(
          useCaseGetAllQueues, useCaseAddNewQueue, useCaseRemoveQueue);
    },
    act: (bloc) => bloc.add(FetchQueues()),
    expect: () => [
      isA<ConfigurationLoading>(),
      isA<ConfigurationExeption>(),
    ],
  );

  blocTest<ConfigurationBloc, ConfigurationState>(
    'AddNewQueue',
    build: () {
      final useCaseGetAllQueues = IGetAllQueuesMock();
      final useCaseAddNewQueue = IAddNewQueueMock();
      final useCaseRemoveQueue = IRemoveQueueMock();
      when(() => useCaseAddNewQueue.call(queueEntityMock))
          .thenAnswer((_) => Future.value());
      return ConfigurationBloc(
          useCaseGetAllQueues, useCaseAddNewQueue, useCaseRemoveQueue);
    },
    act: (bloc) => bloc.add(AddNewQueue(queueEntityMock)),
    expect: () => [],
  );

  blocTest<ConfigurationBloc, ConfigurationState>(
    'RemoveQueue',
    build: () {
      final useCaseGetAllQueues = IGetAllQueuesMock();
      final useCaseAddNewQueue = IAddNewQueueMock();
      final useCaseRemoveQueue = IRemoveQueueMock();
      when(() => useCaseRemoveQueue.call(queueEntityMock))
          .thenAnswer((_) => Future.value());
      return ConfigurationBloc(
          useCaseGetAllQueues, useCaseAddNewQueue, useCaseRemoveQueue);
    },
    act: (bloc) => bloc.add(RemoveQueue(queueEntityMock)),
    expect: () => [],
  );
}

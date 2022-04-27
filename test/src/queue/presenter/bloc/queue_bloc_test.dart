import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_queue/src/queue/presenter/bloc/queue_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mocks.dart';

void main() {
  blocTest<QueueBloc, QueueState>(
    'FetchQueues',
    build: () {
      final useCaseGetAllQueues = IGetAllQueuesMock();
      final useCaseAddNewQueue = IAddNewQueueMock();
      final useCaseRemoveQueue = IRemoveQueueMock();
      when(() => useCaseGetAllQueues.call())
          .thenAnswer((_) => Stream.value([]));
      return QueueBloc(
          useCaseGetAllQueues, useCaseAddNewQueue, useCaseRemoveQueue);
    },
    act: (bloc) => bloc.add(FetchQueuesEvent()),
    expect: () => [
      isA<QueueLoadingState>(),
      isA<QueueLoadedState>(),
    ],
  );

  blocTest<QueueBloc, QueueState>(
    'FetchQueues onError',
    build: () {
      final useCaseGetAllQueues = IGetAllQueuesMock();
      final useCaseAddNewQueue = IAddNewQueueMock();
      final useCaseRemoveQueue = IRemoveQueueMock();
      when(() => useCaseGetAllQueues.call())
          .thenAnswer((_) => Stream.error(Exception('Deu Erro')));
      return QueueBloc(
          useCaseGetAllQueues, useCaseAddNewQueue, useCaseRemoveQueue);
    },
    act: (bloc) => bloc.add(FetchQueuesEvent()),
    expect: () => [
      isA<QueueLoadingState>(),
      isA<QueueExeptionState>(),
    ],
  );

  blocTest<QueueBloc, QueueState>(
    'AddNewQueue',
    build: () {
      final useCaseGetAllQueues = IGetAllQueuesMock();
      final useCaseAddNewQueue = IAddNewQueueMock();
      final useCaseRemoveQueue = IRemoveQueueMock();
      when(() => useCaseAddNewQueue.call(queueEntityMock))
          .thenAnswer((_) => Future.value());
      return QueueBloc(
          useCaseGetAllQueues, useCaseAddNewQueue, useCaseRemoveQueue);
    },
    act: (bloc) => bloc.add(AddNewQueueEvent(queueEntityMock)),
    expect: () => [],
  );

  blocTest<QueueBloc, QueueState>(
    'RemoveQueue',
    build: () {
      final useCaseGetAllQueues = IGetAllQueuesMock();
      final useCaseAddNewQueue = IAddNewQueueMock();
      final useCaseRemoveQueue = IRemoveQueueMock();
      when(() => useCaseRemoveQueue.call(queueEntityMock))
          .thenAnswer((_) => Future.value());
      return QueueBloc(
          useCaseGetAllQueues, useCaseAddNewQueue, useCaseRemoveQueue);
    },
    act: (bloc) => bloc.add(RemoveQueueEvent(queueEntityMock)),
    expect: () => [],
  );
}

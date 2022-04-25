import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_queue/src/configuration/bloc/configuration_bloc.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/mocks.dart';

void main() {
  blocTest<ConfigurationBloc, ConfigurationState>('configuration bloc ...',
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
          ]);
}

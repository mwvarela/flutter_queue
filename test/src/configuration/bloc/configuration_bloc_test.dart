import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_queue/src/configuration/bloc/configuration_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/mocks.dart';

void main() {
  blocTest('configuration bloc ...',
      build: () {
        final usecase = IGetAllQueuesMock();
        when(() => usecase.call()).thenAnswer((_) => Stream.value([]));
        return ConfigurationBloc(usecase);
      },
      expect: () => [isA<ConfigurationLoaded>()]);
}

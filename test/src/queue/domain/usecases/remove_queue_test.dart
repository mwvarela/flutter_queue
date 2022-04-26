import 'package:flutter_queue/src/queue/domain/usecases/remove_queue.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mocks.dart';

void main() {
  test('RemoveQueue', () {
    final repository = IQueueRepositoryMock();

    when(() => repository.removeQueue(queueEntityMock.id))
        .thenAnswer((_) => Future.value());
    final usecase = RemoveQueue(repository);
    expect(usecase.call(queueEntityMock), completes);
  });
}

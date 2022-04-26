import 'package:flutter_queue/src/queue/domain/usecases/add_new_queue.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mocks.dart';

void main() {
  test('add new queue ...', () async {
    final repository = IQueueRepositoryMock();
    when(() => repository.addQueue(queueEntityMock))
        .thenAnswer((_) => Future.value());
    final usecase = AddNewQueue(repository);

    expect(usecase.call(queueEntityMock), completes);
  });
}

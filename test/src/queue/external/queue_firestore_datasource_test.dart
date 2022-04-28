import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_queue/src/queue/external/queue_firestore_datasource.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/mocks.dart';

void main() {
  test('queue firestore datasource getAllQueues', () async {
    final firestore = FakeFirebaseFirestore();
    await firestore.collection('queues').add(queueEntityMap);
    final datasource = QueueFirestoreDatasource(firestore);

    final result = datasource.getAllQueues();
    expect(result, emits(isA<List<Map>>()));
  });

  test('queue firestore datasource addQueue', () async {
    final firestore = FakeFirebaseFirestore();
    final datasource = QueueFirestoreDatasource(firestore);
    await datasource.addQueue(queueEntityMap);

    final ref = firestore.collection('queues');
    final queues = await ref.get();

    expect(queues.docs.length, 1);
    expect(queues.docs.first['title'], 'Exames');
    expect(queues.docs.first.data().containsKey('id'), false);
  });

  test('queue firestore datasource removeAllOrders', () async {
    final firestore = FakeFirebaseFirestore();
    final datasource = QueueFirestoreDatasource(firestore);
    await datasource.addQueue(queueEntityMap);
    await datasource.addQueue(queueEntityMap);
    await datasource.removeAllOrders();

    final ref = firestore.collection('queues');
    final queues = await ref.get();
    expect(queues.docs.first.data().containsKey('orders'), false);
    expect(queues.docs.last.data().containsKey('orders'), false);
  });
}

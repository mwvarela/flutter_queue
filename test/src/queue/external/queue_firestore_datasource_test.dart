import 'dart:math';

import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_queue/src/queue/external/queue_firestore_datasource.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/mocks.dart';

void main() {
  test('queue firestore datasource getAllQueues', () async {
    final firestore = FakeFirebaseFirestore();
    await firestore.collection('queues').add(entitiMap);
    final datasource = QueueFirestoreDatasource(firestore);

    final result = datasource.getAllQueues();

    expect(result, emits(isA<List<Map>>()));
  });
}

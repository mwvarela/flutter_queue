import 'package:cloud_firestore/cloud_firestore.dart';

import '../infra/datasource/queue_datasource.dart';

class QueueFirestoreDatasource implements IQueueDatasource {
  final FirebaseFirestore firestore;

  QueueFirestoreDatasource(this.firestore);

  @override
  Stream<List<Map>> getAllQueues() {
    final reference = firestore.collection('queues');
    final snapshot =
        reference.orderBy('priority', descending: true).snapshots();

    return snapshot.map((e) => e.docs).map(_convert);
  }

  List<Map> _convert(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    return docs
        .map((document) => {
              'id': document.id,
              ...document.data(),
            })
        .toList();
  }

  @override
  Future<void> addQueue(Map<String, dynamic> map) async {
    final reference = firestore.collection('queues');
    reference.add(map..remove('id'));
  }

  @override
  Future<void> removeQueue(String id) async {
    final reference = firestore.collection('queues');
    await reference.doc(id).delete();
  }

  @override
  Future<void> removeAllOrders() async {
    final reference = firestore.collection('queues');
    final snapshots = await reference.get();

    for (var doc in snapshots.docs) {
      final map = doc.data();
      map.remove('orders');
      doc.reference.set(map);
    }
  }
}

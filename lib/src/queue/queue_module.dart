import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:provider/provider.dart';

import 'domain/repositories/queue_repository.dart';
import 'domain/usecases/get_all_queues.dart';
import 'external/queue_firestore_datasource.dart';
import 'infra/datasource/queue_datasource.dart';
import 'infra/repositories/queue_repository.dart';

final queueModule = [
  Provider.value(value: FirebaseFirestore.instance),
  Provider<IQueueDatasource>(
      create: (context) => QueueFirestoreDatasource(context.read())),
  Provider<IQueueRepository>(
      create: (context) => QueueRepository(context.read())),
  Provider<IGetAllQueues>(
    create: (context) => GetAllQueues(context.read()),
  )
];

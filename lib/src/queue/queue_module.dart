import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';

import 'domain/repositories/queue_repository.dart';
import 'domain/usecases/add_new_queue.dart';
import 'domain/usecases/generate_order.dart';
import 'domain/usecases/get_all_queues.dart';
import 'domain/usecases/remove_all_orders.dart';
import 'domain/usecases/remove_queue.dart';
import 'domain/usecases/update_queue.dart';
import 'external/queue_firestore_datasource.dart';
import 'infra/datasource/queue_datasource.dart';
import 'infra/repositories/queue_repository.dart';
import 'presenter/bloc/queue_bloc.dart';

final queueModule = [
  Provider<FirebaseFirestore>.value(value: FirebaseFirestore.instance),
  Provider<IQueueDatasource>(
      create: (context) => QueueFirestoreDatasource(context.read())),
  Provider<IQueueRepository>(
      create: (context) => QueueRepository(context.read())),
  Provider<IGetAllQueues>(create: (context) => GetAllQueues(context.read())),
  Provider<IAddNewQueue>(create: (context) => AddNewQueue(context.read())),
  Provider<IRemoveQueue>(create: (context) => RemoveQueue(context.read())),
  Provider<IUpdateQueue>(create: (context) => UpdateQueue(context.read())),
  Provider<IRemoveAllOrders>(
      create: (context) => RemoveAllOrders(context.read())),
  Provider<IGenerateOrder>(create: (context) => GenerateOrder()),
  BlocProvider(
    create: (context) => QueueBloc(
      context.read(),
      context.read(),
      context.read(),
      context.read(),
    ),
  ),
];

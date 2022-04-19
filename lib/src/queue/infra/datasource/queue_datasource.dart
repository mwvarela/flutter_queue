abstract class IQueueDatasource {
  Stream<List<Map>> getAllQueues();
  Future<void> addQueue(Map<String, dynamic> map);
}

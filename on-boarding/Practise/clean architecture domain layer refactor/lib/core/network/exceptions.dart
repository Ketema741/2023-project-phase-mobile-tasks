class ServerException implements Exception {}

class CacheException implements Exception {}

sealed class CounterEvent {}

final class CounterIncrementPressed extends CounterEvent {}


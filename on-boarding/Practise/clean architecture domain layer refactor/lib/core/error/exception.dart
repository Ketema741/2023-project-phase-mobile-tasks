import 'package:equatable/equatable.dart';

/// Base class for all local exceptions
class CacheException extends Equatable implements Exception {
  final String message;

  const CacheException({required this.message}) : super();

  factory CacheException.cacheNotFound() =>
      const CacheException(message: 'Cache not found');

  factory CacheException.readError() =>
      const CacheException(message: 'Error while parsing json');

  @override
  List<Object?> get props => [message];
}

/// Base class for all server exceptions
class ServerException extends Equatable implements Exception {
  final String message;

  const ServerException({required this.message}) : super();

  factory ServerException.invalidResponse() =>
      const ServerException(message: 'Invalid JSON format');

  factory ServerException.operationFailed() =>
      const ServerException(message: 'Operation failed');

  factory ServerException.connectionFailed() =>
      const ServerException(message: 'Unable to connect to server');

  @override
  List<Object?> get props => [message];
}
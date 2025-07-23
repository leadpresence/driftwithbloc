class DatabaseException implements Exception {
  final String message;
  final int? code;

  const DatabaseException({required this.message, this.code});

  @override
  String toString() => 'DatabaseException: $message (code: $code)';
}

class ValidationException implements Exception {
  final String message;
  final int? code;

  const ValidationException({required this.message, this.code});

  @override
  String toString() => 'ValidationException: $message (code: $code)';
}

class NotFoundException implements Exception {
  final String message;
  final int? code;

  const NotFoundException({required this.message, this.code});

  @override
  String toString() => 'NotFoundException: $message (code: $code)';
}

class ServerException implements Exception {
  final String message;
  final int? code;

  const ServerException({required this.message, this.code});

  @override
  String toString() => 'ServerException: $message (code: $code)';
}

class CacheException implements Exception {
  final String message;
  final int? code;

  const CacheException({required this.message, this.code});

  @override
  String toString() => 'CacheException: $message (code: $code)';
}

class NetworkException implements Exception {
  final String message;
  final int? code;

  const NetworkException({required this.message, this.code});

  @override
  String toString() => 'NetworkException: $message (code: $code)';
}
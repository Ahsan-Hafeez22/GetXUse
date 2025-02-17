class AppException implements Exception {
  final String message;
  final String prefix;

  AppException([this.message = "", this.prefix = "Error: "]);

  @override
  String toString() => "$prefix$message";
}

class InternetException extends AppException {
  InternetException([String message = "No Internet Connection"])
      : super(message, "Internet Error: ");
}

class RequestTimeoutException extends AppException {
  RequestTimeoutException([String message = "Request Timeout"])
      : super(message, "Timeout Error: ");
}

class ServerException extends AppException {
  ServerException([String message = "Internal Server Error"])
      : super(message, "Server Error: ");
}

class BadRequestException extends AppException {
  BadRequestException([String message = "Invalid Request"])
      : super(message, "Bad Request: ");
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String message = "Unauthorized Access"])
      : super(message, "Authorization Error: ");
}

class ForbiddenException extends AppException {
  ForbiddenException([String message = "Access Forbidden"])
      : super(message, "Forbidden: ");
}

class NotFoundException extends AppException {
  NotFoundException([String message = "Resource Not Found"])
      : super(message, "Not Found: ");
}

class ConflictException extends AppException {
  ConflictException([String message = "Data Conflict"])
      : super(message, "Conflict: ");
}

class TooManyRequestsException extends AppException {
  TooManyRequestsException([String message = "Too Many Requests"])
      : super(message, "Rate Limit Exceeded: ");
}

class UnknownException extends AppException {
  UnknownException([String message = "An unknown error occurred"])
      : super(message, "Unknown Error: ");
}

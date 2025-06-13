class AppExceptions implements Exception {
  final _message;
  final _prefix;
  AppExceptions([this._message, this._prefix]);
  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, "Error During Communication");
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message, "Invalid request:");
}

class UnauthorizedRequestException extends AppExceptions {
  UnauthorizedRequestException([String? message])
      : super(message, "Unauthorized request:");
}

class InvalidInputException extends AppExceptions {
  InvalidInputException([String? message])
      : super(message, "Invalid input details");
}

class NotFoundException extends AppExceptions {
  NotFoundException([String? message])
      : super(message, "The requested resource was not found");
}

class ServerException extends AppExceptions {
  ServerException([String? message]) : super(message, "Internet server error");
}

import 'base_exception.dart';
import 'error_code.dart';

class AppException extends BaseException {
  AppException({
    String message = "",
    ErrorCode errorCode = ErrorCode.none,
  }) : super(message: message, errorCode: errorCode);
}

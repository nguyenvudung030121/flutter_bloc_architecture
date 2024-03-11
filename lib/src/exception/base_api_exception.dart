import 'app_exception.dart';
import 'error_code.dart';

abstract class BaseApiException extends AppException {
  final int httpCode;
  final String status;

  BaseApiException({
    this.httpCode = -1,
    this.status = "",
    String message = "",
    ErrorCode errorCode = ErrorCode.none,
  }) : super(
          message: message,
          errorCode: errorCode,
        );
}

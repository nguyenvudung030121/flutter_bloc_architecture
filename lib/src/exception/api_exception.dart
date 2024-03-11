import 'base_api_exception.dart';
import 'error_code.dart';

class ApiException extends BaseApiException {
  ApiException({
    required int httpCode,
    required String status,
    String message = "",
    ErrorCode errorCode = ErrorCode.none,
  }) : super(
            httpCode: httpCode,
            status: status,
            message: message,
            errorCode: errorCode);
}

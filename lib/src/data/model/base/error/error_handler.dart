import '../../../../exception/app_exception.dart';
import '../../../utils/app_logger.dart';

Exception handleError(String error) {
  AppLogger.logger.e("Generic exception: $error");

  return AppException(message: error);
}

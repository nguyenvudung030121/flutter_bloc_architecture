import 'package:logger/logger.dart';

import '../../common/Constant/LoggerConstants.dart';

class AppLogger {
  static final Logger _logger = Logger(
      printer: PrettyPrinter(
    methodCount: LoggerConstants.loggerMethodCount,
    errorMethodCount: LoggerConstants.loggerErrorMethodCount,
    lineLength: LoggerConstants.loggerLineLength,
    colors: true,
    printEmojis: true,
    printTime: false,
  ));

  static Logger get logger => _logger;
}

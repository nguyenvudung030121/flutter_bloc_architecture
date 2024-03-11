import 'error_code.dart';

abstract class BaseException implements Exception {
  final String message;
  final ErrorCode errorCode;

  BaseException({this.message = "", this.errorCode = ErrorCode.none});
}

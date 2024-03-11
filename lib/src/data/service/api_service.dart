import 'package:dio/dio.dart';
import 'package:flutter_blocxx/src/data/model/base/dio_base_request/dio_base_request.dart';
import '../../exception/base_exception.dart';
import '../../exception/error_code.dart';
import '../model/base/base_api_response/api_base_response.dart';
import '../model/base/error/error_handler.dart';
import '../utils/app_logger.dart';
import 'dio_client.dart';

enum APIRequestMethod { get, post, put, delete }

class APIService {
  APIService._();

  static final APIService _instance = APIService._();

  Dio get _dioClient => DioClient.tokenClient;

  factory APIService.getInstance() {
    return _instance;
  }

  Future<ApiResponse> request(
      DioBaseRequest request, APIRequestMethod method) async {
    Response response;
    var path = request.path;
    if (request.pathVariable != null) {
      path = '$path/${request.pathVariable}';
    }
    try {
      switch (method) {
        case APIRequestMethod.get:
          response = await _dioClient.get(
            path,
            queryParameters: request.queryParameters,
          );
          break;
        case APIRequestMethod.post:
          response = await _dioClient.post(
            path,
            data: request.object,
            queryParameters: request.queryParameters,
          );
          break;
        case APIRequestMethod.put:
          response = await _dioClient.put(path, data: request.object);
          break;
        case APIRequestMethod.delete:
          response = await _dioClient.delete(path, data: request.object);
          break;
      }

      return ApiResponse(
        statusCode: response.statusCode,
        data: response.data,
        message: response.data['message'],
        success: response.data['success'],
      );
    } catch (error) {
      AppLogger.logger.e("Generic error: >>>> $error");
      if (error is BaseException) {
        rethrow;
      }
      throw handleError("$error");
    }
  }
}

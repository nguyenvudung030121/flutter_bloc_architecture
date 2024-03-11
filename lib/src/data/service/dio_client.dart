import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../common/Constant/NetworkConstants.dart';

class DioClient {
  static final String baseUrl = "https://dummyjson.com/";

  static final BaseOptions _options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: NetworkConstants.connectTimeout),
    receiveTimeout: const Duration(seconds: NetworkConstants.receiveTimeout),
  );

  static final Dio _instance = Dio(_options);

  static final _prettyDioLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: NetworkConstants.loggerLineWidth,
  );

  static _addInterceptors() {
    _instance.interceptors.clear();
    // TODOs: Add interceptors here
    _instance.interceptors.add(_prettyDioLogger);
  }

  static Dio get tokenClient {
    _addInterceptors();
    // TODO: Will update with Refresh Token interceptor in future
    // _instance.options.headers = {
    //   "Authorization":
    //   "Bearer ${AppEncryptPreference.getInstance().getAccessToken()}"
    // };
    return _instance;
  }

  static String _buildContentType(String version) {
    return "user_defined_content_type+$version";
  }

  DioClient.setContentType(String version) {
    _instance.options.contentType = _buildContentType(version);
  }

  DioClient.setContentTypeApplicationJson() {
    _instance.options.contentType = "application/json";
  }
}

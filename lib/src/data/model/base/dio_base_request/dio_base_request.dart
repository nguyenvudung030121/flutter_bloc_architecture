import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dio_base_request.freezed.dart';

@Freezed(copyWith: false, equal: false)
class DioBaseRequest with _$DioBaseRequest {
  const factory DioBaseRequest({
    required final String path,
    final Object? object,
    final Map<String, dynamic>? queryParameters,
    final String? pathVariable,
    final Options? options,
    final CancelToken? cancelToken,
    final void Function(int, int)? onReceiveProgress,
  }) = _DioBaseRequest;

  const DioBaseRequest._();
}

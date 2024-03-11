// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dio_base_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DioBaseRequest {
  String get path => throw _privateConstructorUsedError;

  Object? get object => throw _privateConstructorUsedError;

  Map<String, dynamic>? get queryParameters =>
      throw _privateConstructorUsedError;

  String? get pathVariable => throw _privateConstructorUsedError;

  Options? get options => throw _privateConstructorUsedError;

  CancelToken? get cancelToken => throw _privateConstructorUsedError;

  void Function(int, int)? get onReceiveProgress =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$DioBaseRequestImpl extends _DioBaseRequest {
  const _$DioBaseRequestImpl(
      {required this.path,
      this.object,
      final Map<String, dynamic>? queryParameters,
      this.pathVariable,
      this.options,
      this.cancelToken,
      this.onReceiveProgress})
      : _queryParameters = queryParameters,
        super._();

  @override
  final String path;
  @override
  final Object? object;
  final Map<String, dynamic>? _queryParameters;

  @override
  Map<String, dynamic>? get queryParameters {
    final value = _queryParameters;
    if (value == null) return null;
    if (_queryParameters is EqualUnmodifiableMapView) return _queryParameters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? pathVariable;
  @override
  final Options? options;
  @override
  final CancelToken? cancelToken;
  @override
  final void Function(int, int)? onReceiveProgress;

  @override
  String toString() {
    return 'DioBaseRequest(path: $path, object: $object, queryParameters: $queryParameters, pathVariable: $pathVariable, options: $options, cancelToken: $cancelToken, onReceiveProgress: $onReceiveProgress)';
  }
}

abstract class _DioBaseRequest extends DioBaseRequest {
  const factory _DioBaseRequest(
      {required final String path,
      final Object? object,
      final Map<String, dynamic>? queryParameters,
      final String? pathVariable,
      final Options? options,
      final CancelToken? cancelToken,
      final void Function(int, int)? onReceiveProgress}) = _$DioBaseRequestImpl;

  const _DioBaseRequest._() : super._();

  @override
  String get path;

  @override
  Object? get object;

  @override
  Map<String, dynamic>? get queryParameters;

  @override
  String? get pathVariable;

  @override
  Options? get options;

  @override
  CancelToken? get cancelToken;

  @override
  void Function(int, int)? get onReceiveProgress;
}

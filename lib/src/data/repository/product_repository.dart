import 'package:either_dart/either.dart';
import 'package:flutter_blocxx/src/data/datasource/remote/product_remote_datasource.dart';
import 'package:flutter_blocxx/src/data/endpoint/end_point.dart';
import 'package:flutter_blocxx/src/data/model/base/dio_base_request/dio_base_request.dart';
import 'package:flutter_blocxx/src/data/model/product/product.dart';
import 'package:flutter_blocxx/src/exception/api_exception.dart';

abstract class ProductRepository {
  Future<Either<ApiException, Product>> getProduct(int id);
}

class ProductRepositoryImpl implements ProductRepository {
  final remoteDataSource = ProductRemoteDataSourceImpl();

  @override
  Future<Either<ApiException, Product>> getProduct(int id) async {
    try {
      final reqeuestParams =
          DioBaseRequest(path: Endpoint.getProduct.path, pathVariable: "$id");
      final response = await remoteDataSource.getProduct(reqeuestParams);
      return Right(response);
    } on ApiException catch (error) {
      return Left(error);
    }
  }
}

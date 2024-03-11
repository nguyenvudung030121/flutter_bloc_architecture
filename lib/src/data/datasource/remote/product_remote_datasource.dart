import 'package:flutter_blocxx/src/data/model/base/dio_base_request/dio_base_request.dart';
import 'package:flutter_blocxx/src/data/model/product/product.dart';
import '../../../exception/api_exception.dart';
import '../../service/api_service.dart';

abstract class ProductRemoteDataSource {
  Future<Product> getProduct(DioBaseRequest request);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  APIService apiService = APIService.getInstance();

  @override
  Future<Product> getProduct(DioBaseRequest request) async {
    final response = await apiService.request(request, APIRequestMethod.get);

    if (response.statusCode == 200 ?? false) {
      final dynamic data = response.data;
      final Product product = Product.fromJson(data);
      return product;
    } else {
      throw ApiException(
        httpCode: response.statusCode ?? -1,
        status: response.message ?? "",
        message: response.message ?? "",
      );
    }
  }
}

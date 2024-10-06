import 'package:store_app/core/network/api_exception.dart';
import 'package:store_app/core/util/resource.dart';
import 'package:store_app/domain/products/data/data_source/product_data_source.dart';
import 'package:store_app/domain/products/domain/entity/product_entity.dart';
import 'package:store_app/domain/products/domain/mapper.dart';
import 'package:store_app/domain/products/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource dataSource;

  ProductRepositoryImpl(this.dataSource);

  @override
  Future<Resource<List<ProductEntity>>> getList([int offset = 0, int limit = 10]) async {
    try {
      final result = await dataSource.getList(offset, limit);
      return Resource.success(result.map((e) => e.toEntity()).toList());
    } catch (ex) {
      if (ex is NetworkException) {
        return Resource.networkError("${ex.prefix}${ex.message}");
      } else if (ex is UnauthorizedException) {
        return Resource.unauthorized(ex.message);
      } else if (ex is ErrorRequestException) {
        return Resource.error(ex.message);
      } else {
        return Resource.error("$ex");
      }
    }
  }

}
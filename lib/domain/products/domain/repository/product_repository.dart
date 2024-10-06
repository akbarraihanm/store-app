import 'package:store_app/core/util/resource.dart';
import 'package:store_app/domain/products/domain/entity/product_entity.dart';

abstract class ProductRepository {
  Future<Resource<List<ProductEntity>>> getList([int offset = 0, int limit = 10]);
}
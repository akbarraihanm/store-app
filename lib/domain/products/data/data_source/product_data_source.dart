import 'package:store_app/domain/products/data/models/product_data.dart';
import 'package:store_app/domain/products/data/service/product_service.dart';

abstract class ProductDataSource {
  Future<List<ProductData>> getList([int offset = 0, int limit = 10]);
}

class ProductDataSourceImpl implements ProductDataSource {
  final ProductService service;

  ProductDataSourceImpl(this.service);

  @override
  Future<List<ProductData>> getList([int offset = 0, int limit = 10]) {
    return service.getList(offset, limit);
  }

}
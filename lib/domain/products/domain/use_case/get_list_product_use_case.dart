import 'package:store_app/core/master/models/query_data.dart';
import 'package:store_app/core/util/resource.dart';
import 'package:store_app/core/util/use_case.dart';
import 'package:store_app/domain/products/domain/entity/product_entity.dart';
import 'package:store_app/domain/products/domain/repository/product_repository.dart';

class GetListProductUseCase extends UseCase<List<ProductEntity>, QueryData> {
  final ProductRepository repository;

  GetListProductUseCase(this.repository);

  @override
  Future<Resource<List<ProductEntity>>> call(QueryData param) {
    return repository.getList(param.offset ?? 0, param.limit ?? 10);
  }

}
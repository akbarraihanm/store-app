import 'package:store_app/di/app_locator.dart';
import 'package:store_app/domain/products/data/data_source/product_data_source.dart';
import 'package:store_app/domain/products/data/repository_impl/product_repository_impl.dart';
import 'package:store_app/domain/products/data/service/product_service.dart';
import 'package:store_app/domain/products/domain/repository/product_repository.dart';
import 'package:store_app/domain/products/domain/use_case/get_list_product_use_case.dart';

class ProductLocator {
  ProductLocator() {
    sl.registerLazySingleton(() => ProductService());
    sl.registerLazySingleton<ProductDataSource>(() => ProductDataSourceImpl(sl()));
    sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(sl()));
    sl.registerLazySingleton(() => GetListProductUseCase(sl()));
  }
}
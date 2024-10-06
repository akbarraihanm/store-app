import 'package:get_it/get_it.dart';
import 'package:store_app/domain/products/di/product_locator.dart';

final sl = GetIt.instance;

class AppLocator {
  AppLocator() {
    ProductLocator();
  }
}
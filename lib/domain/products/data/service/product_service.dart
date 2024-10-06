import 'package:store_app/core/network/http_helper.dart';
import 'package:store_app/core/network/url_helper.dart';
import 'package:store_app/domain/products/data/models/product_data.dart';

class ProductService extends HttpHelper {
  Future<List<ProductData>> getList([int offset = 0, int limit = 10]) async {
    final map = await getMethod(URL.products(offset, limit));
    return List.from(map.map((it) => ProductData.fromJson(it)));
  }
}
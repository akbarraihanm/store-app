import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_app/domain/products/data/data_source/product_data_source.dart';
import 'package:store_app/domain/products/data/service/product_service.dart';

import '../models/product_data_test.dart';

class MockProductService extends Mock implements ProductService {}

void main() {
  late ProductDataSource dataSource;
  final service = MockProductService();
  final productData = MockProductData();

  setUpAll(() {
    dataSource = ProductDataSourceImpl(service);
  });

  group('ProductDataSource test', () {
    /// Mocking data
    when(() => productData.title).thenReturn("Title");
    when(() => productData.price).thenReturn(10);


    /// Mocking call of service
    when(() => service.getList()).thenAnswer((_) async => [productData]);

    /// Test data source
    test('When getList() called, then it should return correct list', () async {
      final result = await dataSource.getList();
      expect(result, [productData]);
      expect(result.first.title, 'Title');
      expect(result.first.price, 10);
    });
  });
}
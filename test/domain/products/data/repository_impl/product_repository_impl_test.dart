import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_app/domain/products/data/data_source/product_data_source.dart';
import 'package:store_app/domain/products/data/repository_impl/product_repository_impl.dart';
import 'package:store_app/domain/products/domain/repository/product_repository.dart';

import '../models/product_data_test.dart';

class MockProductDataSource extends Mock implements ProductDataSource {}

void main() {
  late ProductRepository repository;
  final dataSource = MockProductDataSource();
  final product = MockProductData();

  setUpAll(() {
    repository = ProductRepositoryImpl(dataSource);
  });

  group('ProductRepositoryImpl test', () {
    /// Mocking data
    when(() => product.title).thenReturn("Title");
    when(() => product.price).thenReturn(10);

    /// Mocking dataSource call
    when(() => dataSource.getList()).thenAnswer((_) async => [product]);

    /// Test ProductRepositoryImpl
    test('When getList() called, then it should return correct list', () async {
      final result = await repository.getList();
      final list = result.data ?? [];
      expect(list.first.title, product.title);
      expect(list.first.price, product.price);
    });
  });
}
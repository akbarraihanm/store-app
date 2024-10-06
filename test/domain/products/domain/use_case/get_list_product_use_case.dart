import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_app/core/master/models/query_data.dart';
import 'package:store_app/core/util/resource.dart';
import 'package:store_app/domain/products/domain/repository/product_repository.dart';
import 'package:store_app/domain/products/domain/use_case/get_list_product_use_case.dart';

import '../entity/product_entity_test.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  final repository = MockProductRepository();
  late GetListProductUseCase useCase;
  final product = MockProductEntity();

  setUpAll(() {
    useCase = GetListProductUseCase(repository);
  });

  group('GetListProductUseCase test', () {
    /// Mocking data
    when(() => product.title).thenReturn("Title");
    when(() => product.price).thenReturn(10);
    when(() => product.description).thenReturn('Desc');

    /// Mocking get list product
    when(() => repository.getList()).thenAnswer((_) async => Resource.success([product]));

    /// Test GetListProductUseCase
    test('When getList() called, then it should return correct list', () async {
      final result = await useCase(QueryData());
      final list = result.data ?? [];
      expect(list, [product]);
    });
  });
}
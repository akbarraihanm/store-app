import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_app/domain/products/domain/entity/product_entity.dart';

class MockProductEntity extends Mock implements ProductEntity {}

void main() {
  final product = MockProductEntity();

  group('ProductEntity test', () {
    /// Mocking data
    when(() => product.title).thenReturn("Title");
    when(() => product.price).thenReturn(10);

    test('When ProductEntity init, then it should return correct data', () {
      expect(product.title, 'Title');
      expect(product.price, 10);
    });
  });
}
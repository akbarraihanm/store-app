import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_app/domain/products/data/models/product_data.dart';

class MockProductData extends Mock implements ProductData {}
class MockCategoryData extends Mock implements CategoryData {}

void main() {
  final productData = MockProductData();
  final categoryData = MockCategoryData();

  group('ProductData test', () {
    /// Mocking data
    when(() => productData.title).thenReturn('Title');
    when(() => productData.price).thenReturn(10);
    when(() => categoryData.name).thenReturn('Category');
    when(() => productData.category).thenReturn(categoryData);

    /// Test
    test('When ProductData init, then it should return correct value', () {
      expect(productData.title, 'Title');
      expect(productData.price, 10);
      expect(productData.category, categoryData);
      expect(categoryData.name, 'Category');
    });
  });
}
import 'package:store_app/domain/products/data/models/product_data.dart';
import 'package:store_app/domain/products/domain/entity/product_entity.dart';

extension CategoryToEntity on CategoryData {
  CategoryEntity toEntity() => CategoryEntity(
    id: id,
    name: name,
    image: image,
  );
}

extension ProductToEntity on ProductData {
  ProductEntity toEntity() => ProductEntity(
    id: id,
    title: title,
    price: price,
    description: description,
    images: images,
    creationAt: creationAt,
    category: category?.toEntity(),
  );
}
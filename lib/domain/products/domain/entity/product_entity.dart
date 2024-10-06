class ProductEntity {
  int? id;
  String? title;
  dynamic price;
  String? description;
  List<String>? images;
  String? creationAt;
  CategoryEntity? category;

  ProductEntity({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.category,
  });
}

class CategoryEntity {
  int? id;
  String? name;
  String? image;

  CategoryEntity({
    this.id,
    this.name,
    this.image,
  });
}
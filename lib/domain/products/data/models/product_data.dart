import 'package:json_annotation/json_annotation.dart';
part 'product_data.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductData {
  int? id;
  String? title;
  dynamic price;
  String? description;
  List<String>? images;
  String? creationAt;
  CategoryData? category;

  ProductData({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.category,
  });

  factory ProductData.fromJson(Map<String, dynamic> map) => _$ProductDataFromJson(map);
  Map<String, dynamic> toJson() => _$ProductDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CategoryData {
  int? id;
  String? name;
  String? image;

  CategoryData({
    this.id,
    this.name,
    this.image,
  });

  factory CategoryData.fromJson(Map<String, dynamic> map) => _$CategoryDataFromJson(map);
  Map<String, dynamic> toJson() => _$CategoryDataToJson(this);
}
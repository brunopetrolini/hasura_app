import 'dart:convert';

class ProductModel {
  final String name;
  final double price;
  final TypeAndCategoryDto category;
  final TypeAndCategoryDto productType;
  final String id;

  ProductModel({
    this.name,
    this.price,
    this.category,
    this.productType,
    this.id,
  });

  ProductModel copyWith({
    String name,
    double price,
    TypeAndCategoryDto category,
    TypeAndCategoryDto productType,
    String id,
  }) =>
      ProductModel(
        name: name ?? this.name,
        price: price ?? this.price,
        category: category ?? this.category,
        productType: productType ?? this.productType,
        id: id ?? this.id,
      );

  factory ProductModel.fromJson(String str) =>
      ProductModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        name: json["name"],
        price: json["price"].toDouble(),
        category: TypeAndCategoryDto.fromMap(json["category"]),
        productType: TypeAndCategoryDto.fromMap(json["product_type"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "price": price,
        "category": category.toMap(),
        "product_type": productType.toMap(),
        "id": id,
      };

  static List<ProductModel> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => ProductModel.fromMap(item)).toList();
  }
}

class TypeAndCategoryDto {
  final String description;

  TypeAndCategoryDto({
    this.description,
  });

  TypeAndCategoryDto copyWith({
    String description,
  }) =>
      TypeAndCategoryDto(
        description: description ?? this.description,
      );

  factory TypeAndCategoryDto.fromJson(String str) =>
      TypeAndCategoryDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TypeAndCategoryDto.fromMap(Map<String, dynamic> json) =>
      TypeAndCategoryDto(
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "description": description,
      };
}

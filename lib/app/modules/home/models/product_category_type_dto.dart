import 'dart:convert';

import 'package:hasura_app/app/modules/add_product/models/category_type_dto.dart';

class IdProductCategoryTypeDto {
  final Product product;
  final List<TypeOrCategoryDto> categories;
  final List<TypeOrCategoryDto> productType;

  IdProductCategoryTypeDto({
    this.product,
    this.categories,
    this.productType,
  });

  IdProductCategoryTypeDto copyWith({
    Product productsByPk,
    List<TypeOrCategoryDto> categories,
    List<TypeOrCategoryDto> productType,
  }) =>
      IdProductCategoryTypeDto(
        product: productsByPk ?? this.product,
        categories: categories ?? this.categories,
        productType: productType ?? this.productType,
      );

  factory IdProductCategoryTypeDto.fromJson(String str) =>
      IdProductCategoryTypeDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IdProductCategoryTypeDto.fromMap(Map<String, dynamic> json) =>
      IdProductCategoryTypeDto(
        product: Product.fromMap(json["products_by_pk"]),
        categories: List<TypeOrCategoryDto>.from(
            json["categories"].map((x) => TypeOrCategoryDto.fromMap(x))),
        productType: List<TypeOrCategoryDto>.from(
            json["product_type"].map((x) => TypeOrCategoryDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "products_by_pk": product.toMap(),
        "categories": List<dynamic>.from(categories.map((x) => x.toMap())),
        "product_type": List<dynamic>.from(productType.map((x) => x.toMap())),
      };
}

class Product {
  final String id;
  final String name;
  final String price;
  final TypeOrCategoryDto category;
  final TypeOrCategoryDto productType;

  Product({
    this.id,
    this.name,
    this.price,
    this.category,
    this.productType,
  });

  Product copyWith({
    String id,
    String name,
    String price,
    TypeOrCategoryDto category,
    TypeOrCategoryDto productType,
  }) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        category: category ?? this.category,
        productType: productType ?? this.productType,
      );

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        category: TypeOrCategoryDto.fromMap(json["category"]),
        productType: TypeOrCategoryDto.fromMap(json["product_type"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "price": price,
        "category": category.toMap(),
        "product_type": productType.toMap(),
      };
}

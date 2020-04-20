import 'dart:convert';

class CategoryTypeDto {
  final List<TypeOrCategoryDto> categories;
  final List<TypeOrCategoryDto> productType;

  CategoryTypeDto({
    this.categories,
    this.productType,
  });

  CategoryTypeDto copyWith({
    List<TypeOrCategoryDto> categories,
    List<TypeOrCategoryDto> productType,
  }) =>
      CategoryTypeDto(
        categories: categories ?? this.categories,
        productType: productType ?? this.productType,
      );

  factory CategoryTypeDto.fromJson(String str) =>
      CategoryTypeDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryTypeDto.fromMap(Map<String, dynamic> json) => CategoryTypeDto(
        categories: List<TypeOrCategoryDto>.from(
            json["categories"].map((x) => TypeOrCategoryDto.fromMap(x))),
        productType: List<TypeOrCategoryDto>.from(
            json["product_type"].map((x) => TypeOrCategoryDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toMap())),
        "product_type": List<dynamic>.from(productType.map((x) => x.toMap())),
      };
}

class TypeOrCategoryDto {
  final String id;
  final String description;

  TypeOrCategoryDto({
    this.id,
    this.description,
  });

  TypeOrCategoryDto copyWith({
    String id,
    String description,
  }) =>
      TypeOrCategoryDto(
        id: id ?? this.id,
        description: description ?? this.description,
      );

  factory TypeOrCategoryDto.fromJson(String str) =>
      TypeOrCategoryDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TypeOrCategoryDto.fromMap(Map<String, dynamic> json) =>
      TypeOrCategoryDto(
        id: json["id"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "description": description,
      };
}

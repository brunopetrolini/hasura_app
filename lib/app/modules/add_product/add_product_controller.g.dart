// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddProductController on _AddProductBase, Store {
  final _$descriptionAtom = Atom(name: '_AddProductBase.description');

  @override
  String get description {
    _$descriptionAtom.context.enforceReadPolicy(_$descriptionAtom);
    _$descriptionAtom.reportObserved();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.context.conditionallyRunInAction(() {
      super.description = value;
      _$descriptionAtom.reportChanged();
    }, _$descriptionAtom, name: '${_$descriptionAtom.name}_set');
  }

  final _$priceAtom = Atom(name: '_AddProductBase.price');

  @override
  String get price {
    _$priceAtom.context.enforceReadPolicy(_$priceAtom);
    _$priceAtom.reportObserved();
    return super.price;
  }

  @override
  set price(String value) {
    _$priceAtom.context.conditionallyRunInAction(() {
      super.price = value;
      _$priceAtom.reportChanged();
    }, _$priceAtom, name: '${_$priceAtom.name}_set');
  }

  final _$selectedCategoryAtom = Atom(name: '_AddProductBase.selectedCategory');

  @override
  TypeOrCategoryDto get selectedCategory {
    _$selectedCategoryAtom.context.enforceReadPolicy(_$selectedCategoryAtom);
    _$selectedCategoryAtom.reportObserved();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(TypeOrCategoryDto value) {
    _$selectedCategoryAtom.context.conditionallyRunInAction(() {
      super.selectedCategory = value;
      _$selectedCategoryAtom.reportChanged();
    }, _$selectedCategoryAtom, name: '${_$selectedCategoryAtom.name}_set');
  }

  final _$selectedTypeAtom = Atom(name: '_AddProductBase.selectedType');

  @override
  TypeOrCategoryDto get selectedType {
    _$selectedTypeAtom.context.enforceReadPolicy(_$selectedTypeAtom);
    _$selectedTypeAtom.reportObserved();
    return super.selectedType;
  }

  @override
  set selectedType(TypeOrCategoryDto value) {
    _$selectedTypeAtom.context.conditionallyRunInAction(() {
      super.selectedType = value;
      _$selectedTypeAtom.reportChanged();
    }, _$selectedTypeAtom, name: '${_$selectedTypeAtom.name}_set');
  }

  final _$productTypeAtom = Atom(name: '_AddProductBase.productType');

  @override
  CategoryTypeDto get productType {
    _$productTypeAtom.context.enforceReadPolicy(_$productTypeAtom);
    _$productTypeAtom.reportObserved();
    return super.productType;
  }

  @override
  set productType(CategoryTypeDto value) {
    _$productTypeAtom.context.conditionallyRunInAction(() {
      super.productType = value;
      _$productTypeAtom.reportChanged();
    }, _$productTypeAtom, name: '${_$productTypeAtom.name}_set');
  }

  final _$_AddProductBaseActionController =
      ActionController(name: '_AddProductBase');

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_AddProductBaseActionController.startAction();
    try {
      return super.setDescription(value);
    } finally {
      _$_AddProductBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrice(String value) {
    final _$actionInfo = _$_AddProductBaseActionController.startAction();
    try {
      return super.setPrice(value);
    } finally {
      _$_AddProductBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategory(TypeOrCategoryDto value) {
    final _$actionInfo = _$_AddProductBaseActionController.startAction();
    try {
      return super.setCategory(value);
    } finally {
      _$_AddProductBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setType(TypeOrCategoryDto value) {
    final _$actionInfo = _$_AddProductBaseActionController.startAction();
    try {
      return super.setType(value);
    } finally {
      _$_AddProductBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'description: ${description.toString()},price: ${price.toString()},selectedCategory: ${selectedCategory.toString()},selectedType: ${selectedType.toString()},productType: ${productType.toString()}';
    return '{$string}';
  }
}

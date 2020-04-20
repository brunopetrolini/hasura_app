import 'package:hasura_app/app/modules/add_product/models/category_type_dto.dart';
import 'package:hasura_app/app/modules/add_product/repositories/new_product_repository.dart';
import 'package:mobx/mobx.dart';

part 'add_product_controller.g.dart';

class AddProductController = _AddProductBase with _$AddProductController;

abstract class _AddProductBase with Store {
  final NewProductRepository newProductRepository;

  _AddProductBase(this.newProductRepository) {
    newProductRepository.getTypeCategoryProduct().then((value) {
      productType = value;
    });
  }

  @observable
  String description = "";

  @action
  void setDescription(String value) => description = value;

  @observable
  String price = "";

  @action
  void setPrice(String value) => price = value;

  @observable
  TypeOrCategoryDto selectedCategory;

  @action
  void setCategory(TypeOrCategoryDto value) => selectedCategory = value;

  @observable
  TypeOrCategoryDto selectedType;

  @action
  void setType(TypeOrCategoryDto value) => selectedType = value;

  @observable
  CategoryTypeDto productType;

  Future<bool> saveProduct() async {
    if (description != null &&
        price != null &&
        selectedCategory?.id != null &&
        selectedType?.id != null) {
      return await newProductRepository.saveProduct(
          description, price, selectedCategory.id, selectedType.id);
    }
    return false;
  }
}

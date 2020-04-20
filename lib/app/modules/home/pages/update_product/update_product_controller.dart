import 'package:hasura_app/app/modules/add_product/models/category_type_dto.dart';
import 'package:hasura_app/app/modules/home/models/product_category_type_dto.dart';
import 'package:hasura_app/app/modules/home/repositories/up_product_repository.dart';
import 'package:mobx/mobx.dart';

part 'update_product_controller.g.dart';

class UpdateProductController = _UpdateProductControllerBase
    with _$UpdateProductController;

abstract class _UpdateProductControllerBase with Store {
  final UpProductRepository upProductRepository;
  final String idProduct;

  _UpdateProductControllerBase(this.upProductRepository, this.idProduct) {
    upProductRepository.getProductIdTypeCategory(idProduct).then((data) {
      productUpdate = data;
      price = productUpdate.product.price;
      description = productUpdate.product.name;
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
  IdProductCategoryTypeDto productUpdate;

  Future<bool> updateProduct() async {
    if (description != null &&
        price != null &&
        selectedCategory?.id != null &&
        selectedType?.id != null) {
      return await upProductRepository.updateProduct(
          id: idProduct,
          name: description,
          price: price,
          category: selectedCategory?.id,
          type: selectedType?.id);
    }
    return false;
  }
}

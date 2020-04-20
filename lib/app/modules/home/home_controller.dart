import 'package:hasura_app/app/modules/home/models/product_model.dart';
import 'package:hasura_app/app/modules/home/repositories/home_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  final HomeRepository _homeRepository;

  _HomeBase(this._homeRepository) {
    _homeRepository.getProduct().then((value) => listProduct = value);
  }

  @observable
  List<ProductModel> listProduct = [];
}

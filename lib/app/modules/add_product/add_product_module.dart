import 'package:hasura_app/app/app_module.dart';
import 'package:hasura_app/app/modules/add_product/repositories/new_product_repository.dart';
import 'package:hasura_app/app/modules/add_product/add_product_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_app/app/modules/add_product/add_product_page.dart';
import 'package:hasura_connect/hasura_connect.dart';

class AddProductModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Repositories
        Bind((i) => NewProductRepository(AppModule.to.get<HasuraConnect>())),

        // Controllers
        Bind((i) => AddProductController(i.get<NewProductRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => AddProductPage()),
      ];

  static Inject get to => Inject<AddProductModule>.of();
}

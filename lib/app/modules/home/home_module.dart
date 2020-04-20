import 'package:hasura_app/app/app_module.dart';
import 'package:hasura_app/app/modules/home/pages/update_product/update_product_controller.dart';
import 'package:hasura_app/app/modules/home/pages/update_product/update_product_page.dart';
import 'package:hasura_app/app/modules/home/repositories/home_repository.dart';
import 'package:hasura_app/app/modules/home/repositories/up_product_repository.dart';
import 'package:hasura_app/app/modules/home/widgets/card_product/card_product_controller.dart';
import 'package:hasura_app/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_app/app/modules/home/home_page.dart';
import 'package:hasura_connect/hasura_connect.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Controllers
        Bind((i) => CardProductController()),
        Bind((i) => HomeController(i.get<HomeRepository>())),
        Bind((i) => UpdateProductController(
            i.get<UpProductRepository>(), i.params["id"])),

        // Repositories
        Bind((i) => HomeRepository(AppModule.to.get<HasuraConnect>())),
        Bind((i) => UpProductRepository(AppModule.to.get<HasuraConnect>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router('/update',
            child: (_, args) =>
                UpdateProductPage(idProduct: args.params["id"])),
      ];

  static Inject get to => Inject<HomeModule>.of();
}

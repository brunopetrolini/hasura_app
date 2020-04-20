import 'package:hasura_app/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:hasura_app/app/app_widget.dart';
import 'package:hasura_app/app/modules/add_product/add_product_module.dart';
import 'package:hasura_app/app/modules/home/home_module.dart';
import 'package:hasura_connect/hasura_connect.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),

        // Others
        Bind((i) =>
            HasuraConnect("https://hasura-str.herokuapp.com/v1/graphql")),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: HomeModule()),
        Router('/new', module: AddProductModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}

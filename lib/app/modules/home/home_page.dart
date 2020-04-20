import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hasura_app/app/modules/home/home_controller.dart';
import 'package:hasura_app/app/modules/home/home_module.dart';
import 'package:hasura_app/app/modules/home/widgets/card_product/card_product_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Lista de Produtos"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = HomeModule.to.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
            itemCount: homeController.listProduct.length,
            itemBuilder: (BuildContext context, int index) {
              return CardProductWidget(
                idProduct: homeController.listProduct[index].id,
                title: homeController.listProduct[index].name,
                category:
                    homeController.listProduct[index].category.description,
                prodType:
                    homeController.listProduct[index].productType.description,
                price:
                    "R\$ ${homeController.listProduct[index].price.toStringAsFixed(2).replaceAll(".", ",")}",
              );
            });
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed("/new"),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

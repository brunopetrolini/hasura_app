import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hasura_app/app/modules/add_product/add_product_controller.dart';
import 'package:hasura_app/app/modules/add_product/add_product_module.dart';
import 'package:hasura_app/app/modules/add_product/models/category_type_dto.dart';
import 'package:hasura_app/app/shared/widgets/custom_combobox/custom_combobox_widget.dart';

class AddProductPage extends StatefulWidget {
  final String title;
  const AddProductPage({Key key, this.title = "Novo Produto"})
      : super(key: key);

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  AddProductController addProductController = AddProductModule.to.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: MediaQuery.of(context).size.height - 170,
            right: -50,
            child: CircleAvatar(
              radius: 130,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.4),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 150,
            right: 50,
            child: CircleAvatar(
              radius: 130,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.3),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 120,
            right: 150,
            child: CircleAvatar(
              radius: 130,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Descrição:",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                  ),
                ),
                TextField(
                  onChanged: addProductController.setDescription,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                  decoration: InputDecoration(
                    hintText: "Descrição do produto",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  "Valor:",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                  ),
                ),
                TextField(
                  onChanged: addProductController.setPrice,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                  decoration: InputDecoration(
                    hintText: "Descrição do produto",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  "Categoria:",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                  ),
                ),
                Observer(builder: (_) {
                  if (addProductController.productType == null) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).accentColor),
                          ),
                        ],
                      ),
                    );
                  }

                  return CustomComboboxWidget(
                    items: addProductController.productType.categories
                        .map((value) => Model(value.id, value.description))
                        .toList(),
                    selectedItem: null,
                    onChanged: (value) => addProductController.setCategory(
                        TypeOrCategoryDto(
                            id: value.id, description: value.description)),
                  );
                }),
                Text(
                  "Tipo do Produto:",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                  ),
                ),
                Observer(builder: (_) {
                  if (addProductController.productType == null) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).accentColor),
                          ),
                        ],
                      ),
                    );
                  }

                  return CustomComboboxWidget(
                    items: addProductController.productType.productType
                        .map((value) => Model(value.id, value.description))
                        .toList(),
                    selectedItem: null,
                    onChanged: (value) => addProductController.setType(
                        TypeOrCategoryDto(
                            id: value.id, description: value.description)),
                  );
                }),
                SizedBox(height: 5),
                Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    onPressed: () async {
                      var result = await addProductController.saveProduct();

                      if (result) {
                        Navigator.of(context).pop();
                      } else {
                        showDialog(
                          context: context,
                          child: AlertDialog(
                            content: Text(
                              "Erro ao salvar o produto.",
                              style: TextStyle(fontSize: 16),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "Fechar",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }
                    },
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      "Salvar",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

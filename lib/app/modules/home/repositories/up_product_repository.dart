import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_app/app/modules/home/models/product_category_type_dto.dart';
import 'package:hasura_connect/hasura_connect.dart';

class UpProductRepository extends Disposable {
  HasuraConnect _hasuraConnect;

  UpProductRepository(this._hasuraConnect);

  Future<IdProductCategoryTypeDto> getProductIdTypeCategory(String id) async {
    var query = '''
          query getProductIdCategoryType(\$product_id: uuid) {
            tipo_produto {
                id
                descricao
              }
              categoria_produto {
                id
                descricao
              }
              produto_by_pk(id: \$idProduto) {
                id
                nome
                valor
                tipo_produto_id
                categoria_produto {
                  id
                  descricao
                }
                tipo_produto {
                  id
                  descricao
                }
              }
          }
    ''';

    var snapshot =
        await _hasuraConnect.query(query, variables: {"product_id": id});
    return IdProductCategoryTypeDto.fromMap(snapshot["data"]);
  }

  Future<bool> updateProduct(
      {String id,
      String name,
      String price,
      String category,
      String type}) async {
    var mutation = '''
          mutation updateProduct(\$id: uuid, \$name: String, \$price: float8, \$category: uuid, \$type: uuid) {
            update_products(where: {id: {_eq: \$id}}, _set: {name: \$name, price: \$price, category_id: \$category, type_id: \$type}) {
              affected_rows
            }
          }
    ''';

    var snapshot = await _hasuraConnect.mutation(mutation, variables: {
      "id": id,
      "name": name,
      "price": price,
      "category": category,
      "type": type,
    });
    return snapshot["data"]["update_products"]["affected_rows"] > 0;
  }

  @override
  void dispose() {}
}

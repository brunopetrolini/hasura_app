import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_app/app/modules/add_product/models/category_type_dto.dart';
import 'package:hasura_connect/hasura_connect.dart';

class NewProductRepository extends Disposable {
  final HasuraConnect _hasuraConnect;

  NewProductRepository(this._hasuraConnect);

  Future<CategoryTypeDto> getTypeCategoryProduct() async {
    var query = '''
          query get_type_category {
                categories {
                  id
                  description
                }
                product_type {
                  id
                  description
                }
              } 
    ''';

    var snapshot = await _hasuraConnect.query(query);

    return CategoryTypeDto.fromMap(snapshot["data"]);
  }

  Future<bool> saveProduct(
      String description, String price, String category, String type) async {
    var mutation = '''
          mutation saveProduct(\$description: String, \$price: float8, \$category: uuid, \$type: uuid) {
            insert_products(objects: {name: \$description, price: \$price, category_id: \$category, type_id: \$type}) {
              affected_rows
            }
          }
    ''';

    var snapshot = await _hasuraConnect.mutation(mutation, variables: {
      "description": description,
      "price": price,
      "category": category,
      "type": type,
    });

    return snapshot["data"]["insert_products"]["affected_rows"] > 0;
  }

  @override
  void dispose() {}
}

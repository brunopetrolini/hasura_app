import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_app/app/modules/home/models/product_model.dart';
import 'package:hasura_connect/hasura_connect.dart';

class HomeRepository extends Disposable {
  final HasuraConnect _hasuraConnect;

  HomeRepository(this._hasuraConnect);

  Future<List<ProductModel>> getProduct() async {
    var query = '''
          query search_products {
            products {
              name
              price
              category {
                description
              }
              product_type {
                description
              }
              id
            }
          }
    ''';

    var snapshot = await _hasuraConnect.query(query);

    return ProductModel.fromJsonList(snapshot["data"]["products"] as List);
  }

  @override
  void dispose() {}
}

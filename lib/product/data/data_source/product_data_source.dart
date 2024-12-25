

import 'package:ecommerce_task_elevate/product/data/models/product_response/product_response.dart';

abstract class ProductDataSource{
Future<List<ProductResponse>> getProducts();
}
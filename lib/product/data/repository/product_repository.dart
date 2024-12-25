import 'package:ecommerce_task_elevate/product/data/data_source/product_api_data_source.dart';
import 'package:ecommerce_task_elevate/product/data/data_source/product_data_source.dart';
import 'package:ecommerce_task_elevate/product/data/models/product_response/product_response.dart';
import 'package:injectable/injectable.dart';

@singleton
class ProductRepository {
  // final SourcesDataSource dataSource = SourcesApiDataSource();
  final ProductDataSource product;

  ProductRepository(this.product);

  Future<List<ProductResponse>> getProducts() async {
    return await product.getProducts();


  }
}

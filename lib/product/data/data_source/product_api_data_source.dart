import 'package:dio/dio.dart';
import 'package:ecommerce_task_elevate/product/data/data_source/product_data_source.dart';
import 'package:ecommerce_task_elevate/product/data/models/product_response/product_response.dart';
import 'package:ecommerce_task_elevate/shared/api_constant.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ProductDataSource)
class ProductApiDataSource implements ProductDataSource {
  final Dio _dio;

  ProductApiDataSource({required Dio dio}) : _dio = dio;

  @override
  Future<List<ProductResponse>> getProducts() async {
    try {

      final response = await _dio.get(ApiConstant.productEndPoint);

      final List<dynamic> rawList = response.data as List<dynamic>;
      final List<Map<String, dynamic>> list =
      rawList.map((e) => e as Map<String, dynamic>).toList();

      final List<ProductResponse> products = list.map((json) => ProductResponse.fromJson(json)).toList();

      return products;
    } catch (e) {
      throw Exception('Failed to get Products!');
    }
  }
}

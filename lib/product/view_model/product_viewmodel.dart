import 'package:ecommerce_task_elevate/product/data/models/product_response/product_response.dart';
import 'package:ecommerce_task_elevate/product/data/repository/product_repository.dart';
import 'package:ecommerce_task_elevate/product/view_model/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class ProductViewmodel extends Cubit<ProductState> {
  ProductViewmodel(this._productRepository):super(ProductInitial());
  final ProductRepository _productRepository;

 List<ProductResponse> ?products;

  Future<void> gteProducts() async {
    emit(GetProductsLoading());
    try {
      final result = await _productRepository.getProducts();
      products=result;
      emit(GetProductsSuccess());
    } catch (e) {
      emit(GetProductsError(e.toString()));
    }

  }
}


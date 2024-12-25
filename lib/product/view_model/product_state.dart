
abstract class ProductState {}

class ProductInitial extends ProductState {}

class GetProductsSuccess extends ProductState {

}

class GetProductsLoading extends ProductState {}

class GetProductsError extends ProductState {
  final String message;

  GetProductsError(this.message);
}

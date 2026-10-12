part of 'all_products_cubit.dart';

@immutable
sealed class AllProductsState {}

final class AllProductsInitial extends AllProductsState {}

final class AllProductsLoading extends AllProductsState {}

final class AllProductsSuccess extends AllProductsState {
  final List<ProductResponseModel> products;

  AllProductsSuccess({required this.products});
}

final class AllProductsFail extends AllProductsState {
  final String errorMessage;

  AllProductsFail({required this.errorMessage});
}

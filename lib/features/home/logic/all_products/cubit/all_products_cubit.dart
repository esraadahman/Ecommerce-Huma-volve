import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entities/product.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/use_cases/get_all_products.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/use_cases/get_categories_products.dart';
import 'package:meta/meta.dart';

part 'all_products_state.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  AllProductsCubit(
    this.getAllProducts,
    this.getCategoriesProducts,
  ) : super(AllProductsInitial());
  
  final GetAllProducts getAllProducts;
  final GetCategoriesProducts getCategoriesProducts;
  
  Future<void> getAllProductsMethod() async {
    emit(AllProductsLoading());
    final response = await getAllProducts();
    response.fold(
      (failure) {
        emit(AllProductsFail(errorMessage: failure.displayMessage));
      },
      (result) async {
        emit(AllProductsSuccess(products: result));
      },
    );
  }

  Future<void> getCategoriesProductsMethod(int categoryId) async {
    emit(AllProductsLoading());
    final response = await getCategoriesProducts(categoryId: categoryId);
    response.fold(
      (failure) {
        emit(AllProductsFail(errorMessage: failure.displayMessage));
      },
      (result) async {
        emit(AllProductsSuccess(products: result));
      },
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/model/product_response_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/repo/main_repo.dart';
import 'package:meta/meta.dart';

part 'all_products_state.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  AllProductsCubit(this.repo) : super(AllProductsInitial());
  final MainRepo repo;
  getAllProducts() async {
    emit(AllProductsLoading());
    final response = await repo.getAllProducts();
    response.fold(
      (failure) {
        emit(AllProductsFail(errorMessage: failure.displayMessage));
      },
      (result) async {
        emit(AllProductsSuccess(products: result));
      },
    );
  }

  getCategoriesProducts(int categoryId) async {
    emit(AllProductsLoading());
    final response = await repo.getCategoriesProducts(categoryId: categoryId);
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

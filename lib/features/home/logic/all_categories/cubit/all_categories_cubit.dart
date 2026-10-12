import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/model/category_response_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/repo/main_repo.dart';
import 'package:meta/meta.dart';

part 'all_categories_state.dart';

class AllCategoriesCubit extends Cubit<AllCategoriesState> {
  AllCategoriesCubit(this.repo) : super(AllCategoriesInitial());

  final MainRepo repo;
  getAllCategories() async {
    emit(AllCategoriesLoading());
    final response = await repo.getAllCategories();
    response.fold(
      (failure) {
        emit(AllCategoriesFail(errorMessage: failure.displayMessage));
      },
      (result) async {
        emit(AllCategoriesSuccess(categories: result));
      },
    );
  }
}

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/error/error_handler.dart';
import 'package:ecommerce_app_huma_volve/core/imports/common_imports.dart';
import 'package:ecommerce_app_huma_volve/core/networking/api_service.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/model/category_response_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/model/product_response_model.dart';

class MainRepo {
  final ApiServices apiServices;

  MainRepo(this.apiServices);

  Future<Either<Failure, List<ProductResponseModel>>> getAllProducts() async {
    try {
      final response = await apiServices.getProducts();

      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }

      return left(ServerFailure(localizedKey: "unexpected_error"));
    }
  }

  Future<Either<Failure, List<CategoryResponseModel>>>
  getAllCategories() async {
    try {
      final response = await apiServices.getCategories();

      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }

      return left(ServerFailure(localizedKey: "unexpected_error"));
    }
  }
}

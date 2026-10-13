import 'package:ecommerce_app_huma_volve/core/networking/api_service.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/category_response_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/product_response_model.dart';

class HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSource(this.apiServices);

  Future<List<ProductResponseModel>> getAllProducts() async {
    return await apiServices.getProducts();
  }

  Future<List<ProductResponseModel>> getCategoriesProducts({
    required int categoryId,
  }) async {
    return await apiServices.getCategoriesProducts(categoryId);
  }

  Future<List<CategoryResponseModel>> getAllCategories() async {
    return await apiServices.getCategories();
  }
}

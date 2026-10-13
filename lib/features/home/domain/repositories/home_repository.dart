import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/error/error_handler.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entities/category.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entities/product.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();
  Future<Either<Failure, List<Product>>> getCategoriesProducts({
    required int categoryId,
  });
  Future<Either<Failure, List<Category>>> getAllCategories();
}

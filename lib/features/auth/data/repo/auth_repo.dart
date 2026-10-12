import 'package:ecommerce_app_huma_volve/core/imports/common_imports.dart';

class AuthRepo {
  final ApiServices apiServices;

  AuthRepo(this.apiServices);

  Future<Either<Failure, LoginResponse>> login(
    LoginRequest requestModel,
  ) async {
    try {
      final response = await apiServices.login(requestModel);

      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }

      return left(ServerFailure(localizedKey: "unexpected_error"));
    }
  }

  Future<Either<Failure, SignUpResponse>> signUp(
    SignUpRequest requestModel,
  ) async {
    try {
      final response = await apiServices.signUp(requestModel);

      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }

      return left(ServerFailure(localizedKey: "unexpected_error"));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:github_repo_viewer/config/api_url.dart';
import 'package:github_repo_viewer/model/user_model.dart';

class RemoteServices {
  RemoteServices._();

  static Future<Either<String, UserModel>> fetchUser(
      {required String userName}) async {
    final dio = Dio();

    try {
      // const String url = "$baseUrl$userUrl/$userName";
      final response = await dio.get("$baseUrl$userUrl/$userName");
      if (response.statusCode == 200) {
        final jsonString = response.data;
        final userData = UserModel.fromJson(jsonString);

        return Right(userData);
      } else {
        return const Left("Failed to fetch post data");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response!.statusCode;
        final errorMessage = 'Error $statusCode';
        if (statusCode == 404) {
          return const Left("User Not Found.");
        }
        return Left(errorMessage);
      } else {
        // Error occurred before the request was completed
        const errorMessage = 'No Internet';
        // Return the error message as Left
        return const Left(errorMessage);
      }
    } catch (e) {
      // Handle other types of errors
      final errorMessage = 'Error: $e';

      // Return the error message as Left
      return Left(errorMessage);
    }
  }
}

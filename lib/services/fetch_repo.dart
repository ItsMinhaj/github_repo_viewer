import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../config/api_url.dart';
import '../model/reposityor_model.dart';

class RemoteServices {
  RemoteServices._();

  static Future<Either<String, List<RepositoryModel>>> fetchRepo(
      String repoUserName) async {
    try {
      final dio = Dio();
      final repoUrl = '$baseUrl/users/$repoUserName/repos';

      final response = await dio.get(repoUrl);
      if (response.statusCode == 200) {
        final List<dynamic> jsonString = response.data;
        final repoData =
            jsonString.map((e) => RepositoryModel.fromJson(e)).toList();
        return Right(repoData);
      } else {
        return const Left("Failed to fetch post data");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response!.statusCode;
        final errorMessage = 'Error $statusCode';
        return Left(errorMessage);
      } else {
        const errorMessage = 'No Internet';
        return const Left(errorMessage);
      }
    } catch (e) {
      final errorMessage = 'Error: $e';
      return Left(errorMessage);
    }
  }
}

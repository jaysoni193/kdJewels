import 'package:dio/dio.dart';
import '../api/api_result.dart';

mixin ErrorMixin {
  ApiResult<T> handleAPIError<T>(e) {
    try {
      if (e is DioException) {
        if (e.response?.data is Map) {
          Map<String, dynamic> response = e.response?.data ?? {};
          if (response.containsKey("success") &&
              response['success'] != null &&
              response['success'] == false) {
            if (response.containsKey("validation_error") &&
                response["validation_error"] is Map) {
              final key = response["validation_error"].keys.first;
              if (response["validation_error"][key] is List) {
                return ApiResult.failure(
                    error: (response["validation_error"][key] as List).first);
              } else if (response["validation_error"][key] is String) {
                return ApiResult.failure(
                    error: (response["validation_error"][key] as String));
              }
            }
            return ApiResult.failure(error: response['message']);
          } else {
            return ApiResult.failure(error: response['message']);
          }
        }
      }
      return const ApiResult.failure(error: "Something is wrong");
    } catch (e) {
      return const ApiResult.failure(error: "Something is wrong");
    }
  }
}

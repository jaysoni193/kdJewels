import 'package:dio/dio.dart';
import '../../../../../core/api/api_helpers.dart';

abstract class OnboardingRemoteDatasource {
  Future<Response> getData();
}

class OnboardingRemoteDatasourceImpl extends OnboardingRemoteDatasource {
  final Dio _dio;

  OnboardingRemoteDatasourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Response> getData() async {
    Map<String, dynamic> params = {};
    return await _dio.get(ApiHelpers.apiKey, queryParameters: params);
  }
}

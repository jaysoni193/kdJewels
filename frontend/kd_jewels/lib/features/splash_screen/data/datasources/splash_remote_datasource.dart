import 'package:dio/dio.dart';
import '../../../../core/api/api_helpers.dart';

abstract class SplashRemoteDatasource {
  Future<Response> getData();
}

class SplashRemoteDatasourceImpl extends SplashRemoteDatasource {
  final Dio _dio;

  SplashRemoteDatasourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Response> getData() async {
    Map<String, dynamic> params = {};
    return await _dio.get(ApiHelpers.apiKey, queryParameters: params);
  }
}

import 'package:dio/dio.dart';
import '../../../../../core/api/api_helpers.dart';

abstract class ProfileRemoteDatasource {
  Future<Response> getData();
}

class ProfileRemoteDatasourceImpl extends ProfileRemoteDatasource {
  final Dio _dio;

  ProfileRemoteDatasourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Response> getData() async {
    Map<String, dynamic> params = {};
    return await _dio.get(ApiHelpers.apiKey, queryParameters: params);
  }
}

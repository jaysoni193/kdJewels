import 'package:dio/dio.dart';
import '../../../../../core/api/api_helpers.dart';

abstract class DashboardRemoteDatasource {
  Future<Response> getData();
}

class DashboardRemoteDatasourceImpl extends DashboardRemoteDatasource {
  final Dio _dio;

  DashboardRemoteDatasourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Response> getData() async {
    Map<String, dynamic> params = {};
    return await _dio.get(ApiHelpers.apiKey, queryParameters: params);
  }
}

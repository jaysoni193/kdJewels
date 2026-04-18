import 'package:dio/dio.dart';
import '../../../../../core/api/api_helpers.dart';

abstract class AdminDashboardRemoteDatasource {
  Future<Response> getData();
}

class AdminDashboardRemoteDatasourceImpl extends AdminDashboardRemoteDatasource {
  final Dio _dio;

  AdminDashboardRemoteDatasourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Response> getData() async {
    Map<String, dynamic> params = {};
    return await _dio.get(ApiHelpers.apiKey, queryParameters: params);
  }
}

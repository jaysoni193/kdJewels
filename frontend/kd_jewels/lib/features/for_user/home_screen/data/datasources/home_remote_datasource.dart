import 'package:dio/dio.dart';
import '../../../../../core/api/api_helpers.dart';

abstract class HomeRemoteDatasource {
  Future<Response> getData();
}

class HomeRemoteDatasourceImpl extends HomeRemoteDatasource {
  final Dio _dio;

  HomeRemoteDatasourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Response> getData() async {
    Map<String, dynamic> params = {};
    return await _dio.get(ApiHelpers.apiKey, queryParameters: params);
  }
}

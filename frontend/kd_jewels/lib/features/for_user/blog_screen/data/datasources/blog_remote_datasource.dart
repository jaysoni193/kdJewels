import 'package:dio/dio.dart';
import '../../../../../core/api/api_helpers.dart';

abstract class BlogRemoteDatasource {
  Future<Response> getData();
}

class BlogRemoteDatasourceImpl extends BlogRemoteDatasource {
  final Dio _dio;

  BlogRemoteDatasourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Response> getData() async {
    Map<String, dynamic> params = {};
    return await _dio.get(ApiHelpers.apiKey, queryParameters: params);
  }
}

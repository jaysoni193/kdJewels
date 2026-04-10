import 'package:dio/dio.dart';
import '../../../../../core/api/api_helpers.dart';

abstract class ShopRemoteDatasource {
  Future<Response> getData();
}

class ShopRemoteDatasourceImpl extends ShopRemoteDatasource {
  final Dio _dio;

  ShopRemoteDatasourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Response> getData() async {
    Map<String, dynamic> params = {};
    return await _dio.get(ApiHelpers.apiKey, queryParameters: params);
  }
}

import 'package:dio/dio.dart';
import '../../../../../core/api/api_helpers.dart';

abstract class AddProductsRemoteDatasource {
  Future<Response> getData();
}

class AddProductsRemoteDatasourceImpl extends AddProductsRemoteDatasource {
  final Dio _dio;

  AddProductsRemoteDatasourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Response> getData() async {
    Map<String, dynamic> params = {};
    return await _dio.get(ApiHelpers.apiKey, queryParameters: params);
  }
}

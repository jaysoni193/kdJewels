import 'package:dio/dio.dart';
import '../../../../../core/api/api_helpers.dart';

abstract class CollectionRemoteDatasource {
  Future<Response> getData();
}

class CollectionRemoteDatasourceImpl extends CollectionRemoteDatasource {
  final Dio _dio;

  CollectionRemoteDatasourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Response> getData() async {
    Map<String, dynamic> params = {};
    return await _dio.get(ApiHelpers.apiKey, queryParameters: params);
  }
}

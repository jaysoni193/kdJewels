import 'package:dio/dio.dart';
import '../../../../../core/api/api_helpers.dart';

abstract class OtherScreensRemoteDatasource {
  Future<Response> getData();
}

class OtherScreensRemoteDatasourceImpl extends OtherScreensRemoteDatasource {
  final Dio _dio;

  OtherScreensRemoteDatasourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Response> getData() async {
    Map<String, dynamic> params = {};
    return await _dio.get(ApiHelpers.apiKey, queryParameters: params);
  }
}

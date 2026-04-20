import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../core/api/api_helpers.dart';

abstract class LoginRegisterRemoteDatasource {
  Future<Response> doSignIn(String? email, String? password);
}

class LoginRemoteDatasourceImpl extends LoginRegisterRemoteDatasource {
  final Dio _dio;

  LoginRemoteDatasourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Response> doSignIn(String? email, String? password) async {
    var params = {"email": email, "password": password};
    return await _dio.post(ApiHelpers.signIn, data: jsonEncode(params));
  }

}

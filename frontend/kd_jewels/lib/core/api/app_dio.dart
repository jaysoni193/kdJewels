import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../constants/app_strings.dart';
import '../utils/custom_view/no_internet_widget.dart';
import '../utils/secure_preference_manager.dart';
import 'api_helpers.dart';

class AppDio with DioMixin implements Dio {
  Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  Future<String> getAuthToken() async {
    return await SecurePreferenceManager.getData(AppStrings.authToken);
  }

  Future<String> getRefreshToken() async {
    return await SecurePreferenceManager.getData(AppStrings.refreshToken);
  }

  Future<void> callRefreshToken() async {
    // Call refresh token API
  }

  AppDio._([BaseOptions? options]) {
    options = BaseOptions(
      baseUrl: ApiHelpers.baseUrl,
      contentType: 'application/json',
      connectTimeout: const Duration(minutes: 5),
      sendTimeout: const Duration(minutes: 5),
      receiveTimeout: const Duration(minutes: 5),
    );

    this.options = options;
    interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final isConnected = await hasNetwork();
          if (!isConnected) {
            // Reject the request to prevent Dio from hanging
            handler.reject(DioException(requestOptions: options, error: 'No internet connection', type: DioExceptionType.unknown));
            // Navigate to NoInternetWidget
            final context = navigatorKey.currentContext;
            if (context != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => NoInternetWidget(isOffline: true)));
              });
            }
            return;
          }

          if (options.path.contains(ApiHelpers.signIn)) {
            return handler.next(options);
          }
          String? token = await getAuthToken(); // async OK here

          if (token.isNotEmpty && (!options.path.contains(ApiHelpers.refreshToken))) {
            options.headers["Authorization"] = "Bearer $token";
          }
          // Optional: Log FormData fields
          if (options.data is FormData && kDebugMode) {
            log((options.data as FormData).fields.toString());
          }
          handler.next(options);
        },
        onError: (DioException e, handler) async {
          if (e.requestOptions.path.contains(ApiHelpers.refreshToken)) {
            return handler.reject(e);
          }

          // 2️⃣ Stop if request already retried
          if (e.requestOptions.extra["retry"] == true) {
            print("⛔ Already retried — stopping loop");
            return handler.reject(e);
          }

          if (e.response?.statusCode == 401) {
            try {
              final refreshToken = await getRefreshToken();
              final response = await post(ApiHelpers.refreshToken, data: {'RefreshToken': refreshToken});
              final newAccessToken = response.data['authorization'];
              final newRefreshToken = response.data['refreshToken'];

              // Save new tokens
              await SecurePreferenceManager.saveData(AppStrings.authToken, newAccessToken);

              await SecurePreferenceManager.saveData(AppStrings.refreshToken, newRefreshToken);
              String? token = await getAuthToken();
              final options = e.requestOptions;
              options.extra["retry"] = true;
              options.headers['Authorization'] = 'Bearer $token';

              final cloneReq = await fetch(options);
              return handler.resolve(cloneReq);
            } catch (er) {
              return handler.reject(e);
            }
          }
          return handler.next(e);
        },
      ),
    );

    if (kDebugMode) {
      interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }

    httpClientAdapter = IOHttpClientAdapter();
  }

  static Dio getInstance() => AppDio._();
}

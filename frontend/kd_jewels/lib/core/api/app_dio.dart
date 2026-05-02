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
  // ─── Network check ────────────────────────────────────────────────────────
  Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  // ─── Token getters ────────────────────────────────────────────────────────
  Future<String> getAuthToken() async {
    return await SecurePreferenceManager.getData(AppStrings.authToken);
  }

  Future<String> getRefreshToken() async {
    return await SecurePreferenceManager.getData(AppStrings.refreshToken);
  }

  // ─── Refresh token API call ───────────────────────────────────────────────
  // Matches your Node.js API:
  //   POST /api/auth/refresh
  //   Body  : { "refreshToken": "<token>" }
  //   Response: { "success": true, "accessToken": "...", "refreshToken": "..." }
  Future<void> callRefreshToken() async {
    try {
      final storedRefreshToken = await getRefreshToken();

      if (storedRefreshToken.isEmpty) {
        throw Exception('No refresh token stored — user must log in again');
      }

      // Use a plain Dio instance (not AppDio) to avoid interceptor loop
      final plainDio = Dio(BaseOptions(
        baseUrl: ApiHelpers.baseUrl,
        contentType: 'application/json',
        connectTimeout: const Duration(minutes: 1),
        receiveTimeout: const Duration(minutes: 1),
      ));

      final response = await plainDio.post(
        ApiHelpers.refreshToken, // e.g. '/api/auth/refresh'
        data: {'refreshToken': storedRefreshToken},
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        final newAccessToken  = response.data['accessToken']  as String;
        final newRefreshToken = response.data['refreshToken'] as String;

        // Persist both rotated tokens
        await SecurePreferenceManager.saveData(AppStrings.authToken,    newAccessToken);
        await SecurePreferenceManager.saveData(AppStrings.refreshToken, newRefreshToken);

        log('Tokens refreshed successfully');
      } else {
        throw Exception('Refresh token response invalid: ${response.data}');
      }
    } catch (e) {
      log('callRefreshToken failed: $e');
      rethrow; // Let onError handler catch this and reject
    }
  }

  // ─── Session clear (call on logout or refresh failure) ───────────────────
  Future<void> _clearSessionAndRedirectToLogin() async {
    await SecurePreferenceManager.saveData(AppStrings.authToken,    '');
    await SecurePreferenceManager.saveData(AppStrings.refreshToken, '');

    final context = navigatorKey.currentContext;
    if (context != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Replace with your login route
        Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
      });
    }
  }

  // ─── Constructor ──────────────────────────────────────────────────────────
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
        // ── Request interceptor ──────────────────────────────────────────
        onRequest: (options, handler) async {
          // 1. Check internet
          final isConnected = await hasNetwork();
          if (!isConnected) {
            handler.reject(DioException(
              requestOptions: options,
              error: 'No internet connection',
              type: DioExceptionType.unknown,
            ));
            final context = navigatorKey.currentContext;
            if (context != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => NoInternetWidget(isOffline: true)),
                );
              });
            }
            return;
          }

          // 2. Skip auth header for public routes
          final isPublicRoute = options.path.contains(ApiHelpers.signIn) ||
              options.path.contains(ApiHelpers.signIn) ||
              options.path.contains(ApiHelpers.refreshToken);

          if (isPublicRoute) {
            return handler.next(options);
          }

          // 3. Attach access token to all other requests
          final token = await getAuthToken();
          if (token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          // 4. Debug log for FormData
          if (options.data is FormData && kDebugMode) {
            log((options.data as FormData).fields.toString());
          }

          handler.next(options);
        },

        // ── Error interceptor ────────────────────────────────────────────
        onError: (DioException e, handler) async {
          // Don't retry if it's already a refresh token call
          if (e.requestOptions.path.contains(ApiHelpers.refreshToken)) {
            log('Refresh token call failed — clearing session');
            await _clearSessionAndRedirectToLogin();
            return handler.reject(e);
          }

          // Don't retry if request already retried once (prevents infinite loop)
          if (e.requestOptions.extra['retry'] == true) {
            log('Already retried once — rejecting');
            await _clearSessionAndRedirectToLogin();
            return handler.reject(e);
          }

          // Handle 401 Unauthorized — access token expired
          if (e.response?.statusCode == 401) {
            log('401 received — attempting token refresh');
            try {
              // Refresh both tokens
              await callRefreshToken();

              // Get the newly saved access token
              final newToken = await getAuthToken();

              // Clone the original failed request with new token + retry flag
              final retryOptions = e.requestOptions;
              retryOptions.extra['retry'] = true;
              retryOptions.headers['Authorization'] = 'Bearer $newToken';

              // Retry the original request
              final retryResponse = await fetch(retryOptions);
              return handler.resolve(retryResponse);
            } catch (refreshError) {
              log('Token refresh failed: $refreshError — clearing session');
              await _clearSessionAndRedirectToLogin();
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
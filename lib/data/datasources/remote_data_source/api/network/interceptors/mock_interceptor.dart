import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:monalyse_ui_test/app/constants/mock_paths.dart';

// Class to handle mock requests
class MockInterceptor extends InterceptorsWrapper {
  // Overrides the onRequest method to handle mock requests
  @override
  Future<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      // Loads the JSON data from assets
      final jsonData = await getJsonFromAssets(
        '${MocksPaths.mockPathBaseAssets}${options.path}.json',
      );
      // Resolves the request with the loaded JSON data
      handler.resolve(Response(requestOptions: options, data: jsonData));
    } catch (e) {
      // Rejects the request with a mock error
      handler.reject(DioException(
        requestOptions: options,
        type: DioExceptionType.unknown,
        error: MocksPaths.error,
      ));
    }
  }

  // Loads JSON data from assets
  Future<dynamic> getJsonFromAssets(String path) async {
    final result = await rootBundle.loadString(path);

    return json.decode(result);
  }
}

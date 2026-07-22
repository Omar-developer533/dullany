import 'package:dio/dio.dart';
import 'package:dullany/core/api/api_consumer.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = '';
    dio.interceptors.add(
      LogInterceptor(
        error: true,
        responseBody: true,
        requestBody: true,
        request: true,
        requestUrl: true,
      ),
    );
  }
  @override
  Future delete(String path, {data, Map<String, dynamic>? queryParameters}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future get(String path, {data, Map<String, dynamic>? queryParameters}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future patch(String path, {data, Map<String, dynamic>? queryParameters}) {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future post(String path, {data, Map<String, dynamic>? queryParameters}) {
    // TODO: implement post
    throw UnimplementedError();
  }
}

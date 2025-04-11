import 'package:dio/dio.dart';
import './auth_interceptor.dart';

class DioClient {
  late final Dio _dio;

  static DioClient? _instance;

  // 实现DioClient的单例模式,也就保证了Dio单例
  factory DioClient({required String baseUrl}) {
    _instance ??= DioClient._internal(baseUrl: baseUrl);
    return _instance!;
  }

  DioClient._internal({required String baseUrl}) {
    // 配置请求基本信息
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      contentType: 'application/json',
    );

    // 初始化Dio
    _dio = Dio(options);

    // 添加 认证处理拦截器
    _dio.interceptors.add(AuthInterceptor());
    // _dio.interceptors.add(LoggingInterceptor());
  }

  /// 封装 GET 请求
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      // 此处可以根据错误类型进一步抛出自定义异常或错误信息
      return Future.error(e);
    }
  }

  /// 封装 POST 请求
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      return Future.error(e);
    }
  }
}

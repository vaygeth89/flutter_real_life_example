import 'package:dio/dio.dart';

class ApplicationHttpClient {
  late Dio dio;

  ApplicationHttpClient(String baseUrl) {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      ),
    );
  }
}

import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://calndrapi.b4production.com/common/public",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<Map<String, dynamic>> fetchHomeData() async {
    try {
      Response response = await _dio.get("/home-sections");
      if (response.statusCode == 200) {
        return response.data['data'];
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }
}

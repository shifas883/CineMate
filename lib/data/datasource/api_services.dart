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
    print("DATA IS CAALED IN API");
    try {
      Response response = await _dio.get("/home-sections");
      if (response.statusCode == 200) {
        print("RESPONCE IS HERE${response.data}");
        return response.data['data'];
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }
}

import 'package:cinemate/data/datasource/api_services.dart';
import 'package:cinemate/data/model/home_models.dart';

class HomeRepository {
  final ApiService apiService;

  HomeRepository(this.apiService);

  Future<HomeDataModel> getHomeData() async {
    final response = await apiService.fetchHomeData();
    return HomeDataModel.fromJson(response);
  }
}

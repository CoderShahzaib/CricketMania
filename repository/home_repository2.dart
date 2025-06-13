import 'package:cricketmania/data/network/base_api_sevices.dart';
import 'package:cricketmania/data/network/network_api_services.dart';
import 'package:cricketmania/model/cricket_news.dart';
import 'package:cricketmania/resources/components/app_urls.dart';

class HomeRepository2 {
  final BaseApiServices _apiSevices = NetworkApiServices();
  Future<CricketNews> fetchCricketNews() async {
    try {
      dynamic response = await _apiSevices.getApiResponse(AppUrls.newsList);
      return CricketNews.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:cricketmania/data/network/base_api_sevices.dart';
import 'package:cricketmania/data/network/network_api_services.dart';
import 'package:cricketmania/model/current_matches.dart';
import 'package:cricketmania/resources/components/app_urls.dart';

class HomeRepository {
  final BaseApiServices _apiSevices = NetworkApiServices();
  Future<CurrentMatches> fetchCurrentMatches() async {
    try {
      dynamic response = await _apiSevices.getApiResponse(AppUrls.matchesList);
      return CurrentMatches.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}

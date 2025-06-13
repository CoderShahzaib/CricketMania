import 'package:cricketmania/data/network/base_api_sevices.dart';
import 'package:cricketmania/data/network/network_api_services.dart';
import 'package:cricketmania/model/score_card.dart';
import 'package:cricketmania/resources/components/app_urls.dart';

class ScoreCardRepository {
  final BaseApiServices _apiSevices = NetworkApiServices();
  Future<ScoreCard> fetchScoreCard() async {
    try {
      dynamic response = await _apiSevices.getScoreCard(AppUrls.scorecardList);
      return ScoreCard.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:cricketmania/data/response/api_response.dart';
import 'package:cricketmania/model/score_card.dart';
import 'package:cricketmania/repository/scorecard_repository.dart';
import 'package:flutter/material.dart';

class ScorecardViewModel with ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  void changeTeam(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  final _myRepo = ScoreCardRepository();
  ApiResponse<ScoreCard> scorecardList = ApiResponse.loading();
  setscorecardList(ApiResponse<ScoreCard> response) {
    scorecardList = response;
    notifyListeners();
  }

  Future<void> fetchScorecardListApi() async {
    setscorecardList(ApiResponse.loading());

    _myRepo.fetchScoreCard().then((value) {
      setscorecardList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setscorecardList(ApiResponse.error(error.toString()));
    });
  }
}

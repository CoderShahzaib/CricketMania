import 'package:cricketmania/data/response/api_response.dart';
import 'package:cricketmania/model/current_matches.dart';
import 'package:cricketmania/repository/home_repository.dart';
import 'package:cricketmania/resources/colors.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();
  ApiResponse<CurrentMatches> matchesList = ApiResponse.loading();
  setCurrentMatchesList(ApiResponse<CurrentMatches> response) async {
    matchesList = response;
    notifyListeners();
  }

  changeColor() {
    Color color = AppColors.homeContainerColor;
    Color color2 = AppColors.yellow;
    color = color2;
    notifyListeners();
  }

  Future<void> fetchMatchesListApi() async {
    setCurrentMatchesList(ApiResponse.loading());
    _myRepo.fetchCurrentMatches().then((value) {
      setCurrentMatchesList(ApiResponse.completed(value));
    }).onError(
      (error, stackTrace) {
        setCurrentMatchesList(ApiResponse.error(error.toString()));
      },
    );
  }
}

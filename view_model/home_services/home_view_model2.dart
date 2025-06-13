import 'package:cricketmania/data/response/api_response.dart';
import 'package:cricketmania/model/cricket_news.dart';
import 'package:cricketmania/repository/home_repository2.dart';
import 'package:flutter/material.dart';

class HomeViewModel2 with ChangeNotifier {
  final _myRepo = HomeRepository2();
  ApiResponse<CricketNews> cricketNewsList = ApiResponse.loading();
  setNewsList(ApiResponse<CricketNews> response) {
    cricketNewsList = response;
    notifyListeners();
  }

  Future<void> fetchCricketNews() async {
    setNewsList(ApiResponse.loading());
    _myRepo.fetchCricketNews().then((value) {
      setNewsList(ApiResponse.completed((value)));
    }).onError(
      (error, stackTrace) {
        setNewsList(ApiResponse.error(error.toString()));
      },
    );
  }
}

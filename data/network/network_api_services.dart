import 'dart:convert';

import 'package:cricketmania/data/network/base_api_sevices.dart';
import 'package:cricketmania/data/response/exception.dart';
import 'package:http/http.dart';

class NetworkApiServices extends BaseApiServices {
  Map<String, String> _headers() {
    return {
      "x-rapidapi-host": "cricbuzz-cricket.p.rapidapi.com",
      "x-rapidapi-key": "51467c140emsh26c4d432d60126bp1d911djsn5deb38f38962",
      "Content-Type": "application/json",
      "Accept": "application/json"
    };
  }

  dynamic responseJson;
  @override
  Future getApiResponse(String url) async {
    try {
      final Response response = await get(
        Uri.parse(url),
        headers: _headers(),
      ).timeout(
        const Duration(seconds: 10),
      );
      return returnResponse(response);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future getScoreCard(String url) async {
    try {
      final Response response = await get(
        Uri.parse(url),
        headers: _headers(),
      ).timeout(
        const Duration(seconds: 10),
      );
      return returnResponse(response);
    } catch (e) {
      throw e.toString();
    }
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var data = utf8.decode(response.bodyBytes);
        responseJson = jsonDecode(data);
        return responseJson;
      default:
        throw FetchDataException(
          "Error occured while communicating with server with status code ${response.statusCode}",
        );
    }
  }
}

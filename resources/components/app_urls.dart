import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppUrls {
  static final matchesList = dotenv.env['MATCHES_URL'] ?? '';
  static final newsList = dotenv.env['NEWS_URL'] ?? '';
  static final scorecardList = dotenv.env['SCORECARD_URL'] ?? '';
}

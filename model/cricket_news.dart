class CricketNews {
  CricketNews({
    required this.status,
    required this.totalResults,
    required this.results,
    required this.nextPage,
  });

  final String? status;
  final int? totalResults;
  final List<Result> results;
  final String? nextPage;

  factory CricketNews.fromJson(Map<String, dynamic> json) {
    return CricketNews(
      status: json["status"],
      totalResults: json["totalResults"],
      results: json["results"] == null
          ? []
          : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
      nextPage: json["nextPage"],
    );
  }
}

class Result {
  Result({
    required this.articleId,
    required this.title,
    required this.link,
    required this.keywords,
    required this.creator,
    required this.videoUrl,
    required this.description,
    required this.content,
    required this.pubDate,
    required this.pubDateTz,
    required this.imageUrl,
    required this.sourceId,
    required this.sourcePriority,
    required this.sourceName,
    required this.sourceUrl,
    required this.sourceIcon,
    required this.language,
    required this.country,
    required this.category,
    required this.aiTag,
    required this.sentiment,
    required this.sentimentStats,
    required this.aiRegion,
    required this.aiOrg,
    required this.duplicate,
  });

  final String? articleId;
  final String? title;
  final String? link;
  final dynamic keywords;
  final List<String> creator;
  final dynamic videoUrl;
  final String? description;
  final String? content;
  final DateTime? pubDate;
  final String? pubDateTz;
  final String? imageUrl;
  final String? sourceId;
  final int? sourcePriority;
  final String? sourceName;
  final String? sourceUrl;
  final String? sourceIcon;
  final String? language;
  final List<String> country;
  final List<String> category;
  final String? aiTag;
  final String? sentiment;
  final String? sentimentStats;
  final String? aiRegion;
  final String? aiOrg;
  final bool? duplicate;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      articleId: json["article_id"],
      title: json["title"],
      link: json["link"],
      keywords: json["keywords"],
      creator: json["creator"] == null
          ? []
          : List<String>.from(json["creator"]!.map((x) => x)),
      videoUrl: json["video_url"],
      description: json["description"],
      content: json["content"],
      pubDate: DateTime.tryParse(json["pubDate"] ?? ""),
      pubDateTz: json["pubDateTZ"],
      imageUrl: json["image_url"],
      sourceId: json["source_id"],
      sourcePriority: json["source_priority"],
      sourceName: json["source_name"],
      sourceUrl: json["source_url"],
      sourceIcon: json["source_icon"],
      language: json["language"],
      country: json["country"] == null
          ? []
          : List<String>.from(json["country"]!.map((x) => x)),
      category: json["category"] == null
          ? []
          : List<String>.from(json["category"]!.map((x) => x)),
      aiTag: json["ai_tag"],
      sentiment: json["sentiment"],
      sentimentStats: json["sentiment_stats"],
      aiRegion: json["ai_region"],
      aiOrg: json["ai_org"],
      duplicate: json["duplicate"],
    );
  }
}

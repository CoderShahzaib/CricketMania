import 'package:cricketmania/resources/colors.dart';
import 'package:cricketmania/utils/routes/routes_name.dart';
import 'package:cricketmania/view_model/home_services/home_components.dart';
import 'package:cricketmania/view_model/home_services/home_view_model2.dart';
import 'package:cricketmania/view_model/home_services/news_details.dart';
import 'package:cricketmania/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cricketmania/data/response/status.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<HomeViewModel>(context, listen: false).fetchMatchesListApi();
    });
    Future.microtask(() {
      Provider.of<HomeViewModel2>(context, listen: false).fetchCricketNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Padding(
          padding: EdgeInsets.all(5),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/Designer.jpg'),
          ),
        ),
        title: const Text(
          "CricketMania",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.search,
            size: 35,
            color: AppColors.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<HomeViewModel>(builder: (context, value, child) {
              switch (value.matchesList.status) {
                case Status.loading:
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: SizedBox(
                        height: height * 0.35,
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.only(bottom: 10.0),
                            color: Colors.white,
                            height: height * 0.1,
                          ),
                        ),
                      ),
                    ),
                  );
                case Status.completed:
                  var matchTypes = value.matchesList.data?.typeMatches ?? [];
                  List<dynamic> allMatches = [];
                  for (var type in matchTypes) {
                    for (var series in type.seriesMatches) {
                      if (series.seriesAdWrapper?.matches != null) {
                        allMatches.addAll(series.seriesAdWrapper!.matches);
                      }
                    }
                  }

                  return SizedBox(
                    height: height * 0.25,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: allMatches.length,
                      itemBuilder: (context, index) {
                        var match = allMatches[index];
                        var matchInfo = match.matchInfo;
                        var matchScore = match.matchScore;
                        var team1 = matchInfo?.team1;
                        var team2 = matchInfo?.team2;
                        var team1Score = matchScore?.team1Score?.inngs1;
                        var team2Score = matchScore?.team2Score?.inngs1;

                        return HomeScore(
                          matchInfo:
                              "${matchInfo?.matchDesc},${matchInfo.seriesName}" ??
                                  "Unknown Series",
                          scoreTeam1: team1Score != null
                              ? "${team1Score.runs}-${team1Score.wickets}"
                              : "0-0",
                          scoreTeam2: team2Score != null
                              ? "${team2Score.runs}-${team2Score.wickets}"
                              : "0-0",
                          overTeam1: team1Score?.overs != null
                              ? "${team1Score.overs} ov"
                              : "0.0 ov",
                          overTeam2: team2Score?.overs != null
                              ? "${team2Score.overs} ov"
                              : "0.0 ov",
                          imagePathTeam1: team1?.imageId != null
                              ? "https://www.cricbuzz.com/a/img/v1/800x800/i1/c${team1.imageId}/image.jpg"
                              : "assets/default_team.png",
                          imagePathTeam2: team2?.imageId != null
                              ? "https://www.cricbuzz.com/a/img/v1/800x800/i1/c${team2.imageId}/image.jpg"
                              : "assets/default_team.png",
                          teamName1: team1.teamName ?? "Team 1",
                          teamName2: team2.teamName ?? "Team 2",
                        );
                      },
                    ),
                  );
                case Status.error:
                  return const Center(
                    child: Text(
                      "Something went wrong!",
                      style: TextStyle(color: AppColors.red),
                    ),
                  );
                default:
                  return const Center(
                    child: Text(
                      "Something went wrong!",
                      style: TextStyle(color: AppColors.red),
                    ),
                  );
              }
            }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Latest Stories",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, RoutesName.seeAllScreen),
                    child: const Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.yellow,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Consumer<HomeViewModel2>(
              builder: (context, value, child) {
                switch (value.cricketNewsList.status) {
                  case Status.loading:
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: SizedBox(
                          height: height * 0.35,
                          child: ListView.builder(
                            itemCount: 3,
                            itemBuilder: (context, index) => Container(
                              margin: const EdgeInsets.only(bottom: 10.0),
                              color: Colors.white,
                              height: height * 0.1,
                            ),
                          ),
                        ),
                      ),
                    );
                  case Status.completed:
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: SizedBox(
                        height: height * 0.35,
                        child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            var news =
                                value.cricketNewsList.data!.results[index];
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NewsDetails(
                                        image: news.imageUrl!,
                                        textTitle: news.title!,
                                        text: news.description!,
                                        date: news.pubDate.toString(),
                                        actionButton: () {
                                          launchUrl(Uri.parse(news.link!),
                                              mode: LaunchMode
                                                  .externalApplication);
                                        }),
                                  ),
                                );
                              },
                              child: HomeSecondContainer(
                                image: news.imageUrl!,
                                title: news.title!,
                              ),
                            );
                          },
                        ),
                      ),
                    );

                  case Status.error:
                    return const Center(child: Text("Something went wrong!"));
                  default:
                    return const Center(
                      child: Text("Something went wrong"),
                    );
                }
              },
            ),
            Consumer<HomeViewModel2>(
              builder: (context, value, child) {
                switch (value.cricketNewsList.status) {
                  case Status.loading:
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: SizedBox(
                          height: height * 0.35,
                          child: ListView.builder(
                            itemCount: 3,
                            itemBuilder: (context, index) => Container(
                              margin: const EdgeInsets.only(bottom: 10.0),
                              color: Colors.white,
                              height: height * 0.1,
                            ),
                          ),
                        ),
                      ),
                    );
                  case Status.completed:
                    var news = value.cricketNewsList.data!.results[2];
                    return SizedBox(
                      height: height * 0.15,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetails(
                                  image: news.imageUrl!,
                                  textTitle: news.title!,
                                  text: news.description!,
                                  date: news.pubDate.toString(),
                                  actionButton: () {
                                    launchUrl(Uri.parse(news.link!),
                                        mode: LaunchMode.externalApplication);
                                  }),
                            ),
                          );
                        },
                        child: HomeThirdContainer(
                          image: news.imageUrl!,
                          title: news.title!,
                          date: news.pubDate!.toString(),
                        ),
                      ),
                    );

                  case Status.error:
                    return const Center(child: Text("Something went wrong!"));
                  default:
                    return const Center(
                      child: Text("Something went wrong"),
                    );
                }
              },
            ),
            Consumer<HomeViewModel2>(
              builder: (context, value, child) {
                switch (value.cricketNewsList.status) {
                  case Status.loading:
                    return const Center(child: CircularProgressIndicator());
                  case Status.completed:
                    var news = value.cricketNewsList.data!.results[1];
                    return SizedBox(
                      height: height * 0.15,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetails(
                                  image: news.imageUrl!,
                                  textTitle: news.title!,
                                  text: news.description!,
                                  date: news.pubDate.toString(),
                                  actionButton: () {
                                    launchUrl(Uri.parse(news.link!),
                                        mode: LaunchMode.externalApplication);
                                  }),
                            ),
                          );
                        },
                        child: HomeThirdContainer(
                          image: news.imageUrl!,
                          title: news.title!,
                          date: news.pubDate!.toString(),
                        ),
                      ),
                    );

                  case Status.error:
                    return const Center(child: Text("Something went wrong!"));
                  default:
                    return const Center(
                      child: Text("Something went wrong"),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

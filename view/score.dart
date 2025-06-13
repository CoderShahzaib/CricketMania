import 'package:cricketmania/resources/colors.dart';
import 'package:cricketmania/view_model/scorecard_services/scorecard_components.dart';
import 'package:cricketmania/view_model/scorecard_services/scorecard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Provider.of<ScorecardViewModel>(context, listen: false)
            .fetchScorecardListApi();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: const Text(
          "Scoreboard",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.black,
      ),
      body: SingleChildScrollView(
        child: Consumer<ScorecardViewModel>(builder: (context, value, child) {
          if (value.scorecardList.data == null) {
            return const Center(
              child: Text(
                "No ScoreCard available",
                style: TextStyle(color: AppColors.white, fontSize: 18),
              ),
            );
          }

          var batsmanData = value.scorecardList.data!
              .scoreCard[value.selectedIndex].batTeamDetails!.batsmenData.values
              .toList();
          var bowlersData = value
              .scorecardList
              .data!
              .scoreCard[value.selectedIndex]
              .bowlTeamDetails!
              .bowlersData!
              .bowlers;
          return SizedBox(
            width: width * double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: height * 0.2,
                    width: width * 0.95,
                    decoration: BoxDecoration(
                      color: AppColors.homeContainerColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.15,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.all(6),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/pakistan.jpg'),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  value.scorecardList.data!.matchHeader!.team1!
                                      .name
                                      .toString(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.07,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${value.scorecardList.data!.scoreCard[0].scoreDetails!.runs}-${value.scorecardList.data!.scoreCard[0].scoreDetails!.wickets}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  Text(
                                    "${value.scorecardList.data!.scoreCard[0].scoreDetails!.overs}",
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const VerticalDivider(
                                color: AppColors.white,
                                thickness: 0.5,
                              ),
                              Row(
                                children: [
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.all(6),
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage('assets/austrailia.jpg'),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      value.scorecardList.data!.matchHeader!
                                          .team1!.name
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.07,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${value.scorecardList.data!.scoreCard[1].scoreDetails!.runs}-${value.scorecardList.data!.scoreCard[1].scoreDetails!.wickets}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      Text(
                                        "${value.scorecardList.data!.scoreCard[1].scoreDetails!.overs}",
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ]),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          value.scorecardList.data!.matchHeader!.status
                              .toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          value.changeTeam(0);
                        },
                        child: Container(
                          height: height * 0.05,
                          width: width * 0.35,
                          decoration: BoxDecoration(
                            color: value.selectedIndex == 0
                                ? AppColors.yellow
                                : AppColors.homeContainerColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              value.scorecardList.data!.scoreCard[0]
                                  .batTeamDetails!.batTeamName
                                  .toString(),
                              style: TextStyle(
                                  color: value.selectedIndex == 0
                                      ? AppColors.black
                                      : AppColors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          value.changeTeam(1);
                        },
                        child: Container(
                          height: height * 0.05,
                          width: width * 0.35,
                          decoration: BoxDecoration(
                            color: value.selectedIndex == 1
                                ? AppColors.yellow
                                : AppColors.homeContainerColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              value.scorecardList.data!.scoreCard[1]
                                  .batTeamDetails!.batTeamName
                                  .toString(),
                              style: TextStyle(
                                  color: value.selectedIndex == 1
                                      ? AppColors.black
                                      : AppColors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: width * double.infinity,
                  height: height * 0.05,
                  decoration: const BoxDecoration(
                    color: AppColors.homeContainerColor,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Row(
                      children: [
                        const Text(
                          "Batter ↓",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.yellow,
                          ),
                        ),
                        SizedBox(
                          width: width * 0.3,
                        ),
                        const Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "R",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "B",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "4s",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "6s",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "SR",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                    height: height * 0.7,
                    child: ListView.builder(
                      itemCount: batsmanData.length,
                      itemBuilder: (context, index) {
                        var batsman = batsmanData[index];
                        return BatterDetails(
                          name: batsman.batName.toString(),
                          outType: batsman.outDesc.toString(),
                          runs: batsman.runs!.toInt(),
                          balls: batsman.balls!.toInt(),
                          fours: batsman.fours!.toInt(),
                          sixes: batsman.sixes!.toInt(),
                          strikeRate: batsman.strikeRate!.toDouble(),
                        );
                      },
                    )),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Row(
                    children: [
                      const Text(
                        "Bowler ↓",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.yellow,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.3,
                      ),
                      const Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "O",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "M",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "R",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "W",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    height: height * 0.5,
                    child: ListView.builder(
                      itemCount: bowlersData.length,
                      itemBuilder: (context, index) {
                        return BowlerDetails(
                          name: bowlersData[index].bowlName.toString(),
                          over: bowlersData[index].overs.toString(),
                          maiden: bowlersData[index].maidens.toString(),
                          runs: bowlersData[index].runs.toString(),
                          wicket: bowlersData[index].wickets.toString(),
                        );
                      },
                    )),
              ],
            ),
          );
        }),
      ),
    );
  }
}

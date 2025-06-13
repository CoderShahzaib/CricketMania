import 'package:cricketmania/resources/colors.dart';
import 'package:flutter/material.dart';

class HomeScore extends StatelessWidget {
  final String matchInfo;
  final String scoreTeam1;
  final String scoreTeam2;
  final String overTeam1;
  final String overTeam2;
  final String imagePathTeam1;
  final String imagePathTeam2;
  final String teamName1;
  final String teamName2;
  const HomeScore(
      {super.key,
      required this.matchInfo,
      required this.scoreTeam1,
      required this.scoreTeam2,
      required this.overTeam1,
      required this.overTeam2,
      required this.imagePathTeam1,
      required this.imagePathTeam2,
      required this.teamName1,
      required this.teamName2});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: height * 0.2,
        width: width * 0.75,
        decoration: BoxDecoration(
          color: AppColors.homeContainerColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(3),
                child: Text(
                  "Recent Match",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.red,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Text(
                  matchInfo,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(imagePathTeam1),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Text(
                            teamName1,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      )),
                  Column(
                    children: [
                      Text(
                        scoreTeam1,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        overTeam1,
                        style: const TextStyle(
                          fontSize: 8,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(imagePathTeam2),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Text(
                            teamName2,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      )),
                  Column(
                    children: [
                      Text(
                        scoreTeam2,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        overTeam2,
                        style: const TextStyle(
                          fontSize: 8,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeSecondContainer extends StatelessWidget {
  final String image;
  final String title;
  const HomeSecondContainer(
      {super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height * 0.33,
        width: width * 0.94,
        decoration: BoxDecoration(
          color: AppColors.homeContainerColor,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeThirdContainer extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  const HomeThirdContainer(
      {super.key,
      required this.image,
      required this.title,
      required this.date});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(width: width * 0.01),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              image,
              height: height * 0.12,
              width: width * 0.3,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(width: width * 0.01),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(Icons.lock_clock, color: AppColors.white),
                    ),
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

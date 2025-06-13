import 'package:cricketmania/resources/colors.dart';
import 'package:cricketmania/view_model/home_services/home_view_model2.dart';
import 'package:cricketmania/view_model/home_services/news_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SeeAllPage extends StatefulWidget {
  const SeeAllPage({super.key});

  @override
  State<SeeAllPage> createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: AppColors.black,
        title: const Text(
          "Cricket News",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        elevation: 5,
      ),
      body: Consumer<HomeViewModel2>(
        builder: (context, value, child) {
          if (value.cricketNewsList.data == null ||
              value.cricketNewsList.data!.results.isEmpty) {
            return const Center(
              child: Text(
                "No news available",
                style: TextStyle(color: AppColors.white, fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            itemCount: value.cricketNewsList.data!.results.length,
            itemBuilder: (context, index) {
              var news = value.cricketNewsList.data!.results[index];

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
                                    mode: LaunchMode.externalApplication);
                              })));
                },
                child: Card(
                  color: Colors.black,
                  elevation: 4,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            news.imageUrl!,
                            width: 90,
                            height: 80,
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                              return const SizedBox(
                                height: 80,
                                width: 90,
                                child: Icon(
                                  Icons.error,
                                  color: AppColors.white,
                                  size: 30,
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                news.title!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                news.pubDate!.toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

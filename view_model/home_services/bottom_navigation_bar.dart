import 'package:cricketmania/view/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cricketmania/resources/colors.dart';
import 'package:cricketmania/view/home.dart';
import 'package:cricketmania/view/score.dart';
import 'package:cricketmania/view_model/home_services/home_services.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomeScreen(),
      const ScoreScreen(),
      const LoginScreen(),
    ];

    return Consumer<HomeServices>(
      builder: (context, homeServices, child) {
        return Scaffold(
          body: pages[homeServices.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.score), label: "Score"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Account"),
            ],
            backgroundColor: AppColors.black,
            currentIndex: homeServices.selectedIndex,
            onTap: homeServices.onTapIndex,
            selectedItemColor: Colors.yellow,
            unselectedItemColor: Colors.white,
          ),
        );
      },
    );
  }
}

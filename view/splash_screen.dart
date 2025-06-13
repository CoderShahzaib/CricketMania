import 'package:cricketmania/resources/colors.dart';
import 'package:cricketmania/view_model/splash_services/animation_provider.dart';
import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    final animationProvider =
        Provider.of<AnimationProvider>(context, listen: false);
    animationProvider.animationInitializer(context, this);
  }

  @override
  void dispose() {
    super.dispose();
    final animationProvider = Provider.of<AnimationProvider>(context);
    animationProvider.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animationProvider = Provider.of<AnimationProvider>(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF00008B),
              Color(0xFF1C1C1C),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: animationProvider.animationController.value * 150,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/Designer.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TypeWriter.text(
              "CricketMania",
              maintainSize: true,
              softWrap: false,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
              duration: const Duration(milliseconds: 150),
            ),
          ],
        ),
      ),
    );
  }
}

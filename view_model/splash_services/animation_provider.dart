import 'package:flutter/material.dart';
import 'package:cricketmania/utils/routes/routes_name.dart';

class AnimationProvider with ChangeNotifier {
  late AnimationController _animationController;
  AnimationController get animationController => _animationController;
  void animationInitializer(BuildContext context, TickerProvider vsync) {
    _animationController =
        AnimationController(vsync: vsync, duration: const Duration(seconds: 2));
    _animationController.forward();
    _animationController.addListener(() {
      notifyListeners();
    });
    _animationController.addStatusListener((status) {
      if (status.isCompleted) {
        Navigator.pushReplacementNamed(context, RoutesName.home);
      }
    });
  }

  void disposeAnimation() {
    _animationController.dispose();
  }
}

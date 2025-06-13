import 'package:flutter/material.dart';

class HomeServices with ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  void onTapIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

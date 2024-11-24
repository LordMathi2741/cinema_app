import 'package:flutter/cupertino.dart';

class UiProvider extends ChangeNotifier{
  int currentIndex = 0;
  void onNavigateRoute(int index){
    currentIndex = index;
    notifyListeners();
  }
}
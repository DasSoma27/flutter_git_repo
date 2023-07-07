import 'package:flutter/cupertino.dart';

class CountNumber with ChangeNotifier{
  int count = 0;

  void increment(){
    count+=2 ;
    notifyListeners();

  }

  void decrement(){
    count--;
    notifyListeners();
  }

}
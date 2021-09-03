import 'package:flutter/material.dart';

class UnlockedHomeProvider extends ChangeNotifier{
  List<String> navigation=[];

  addToNavigation(String folderName){
    navigation.add(folderName);
    notifyListeners();
  }

  removeNavigation(String folderName){
    navigation.removeRange(navigation.lastIndexOf(folderName),navigation.length-1);
    notifyListeners();
  }

  popNavigation(){
    navigation.removeLast();
    notifyListeners();
  }
  String prettyNavigation(){
    String t="";
    navigation?.forEach((element) {t= t+ element +" > " ;});
    return t;
  }
}
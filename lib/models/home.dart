import 'package:cboard_mobile/data/data.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:cboard_mobile/unlocked/UnlockedHomepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeModel extends ChangeNotifier {
  List<TileData> words = [];
  String fullSent = "";

  void addWords(TileData newTile) {
    words.add(newTile);
    //For adding sentence to top bar
    // String newWord = newTile.name != "Edit" ? newTile.name : newTile.content;
    String newWord = newTile.labelKey.split('.').last;
    fullSent += newWord + ". ";
    print(fullSent);
  int _unlockCount = 0;
    notifyListeners();
  }

  List<TileData> getWords() {
    return words;
  }

  void removeWords() {
    if (words.length > 0) {
      fullSent = fullSent.substring(
          0, fullSent.length - words.last.labelKey.split('.').last.length - 2);
      words.removeLast();
    }
    notifyListeners();
  }

  String getFullSent() {
    return fullSent;
  }

  void tapUnlock(BuildContext context){
    _unlockCount++;
    if(_unlockCount==3){
      final _screenSize=MediaQuery.of(context).size;
      // unlock dialog
      showDialog(
          context: context,
          builder: (context){
            int unlock = 2;
            return AlertDialog(
              backgroundColor: Theme.of(context).primaryColor,
              insetPadding: EdgeInsets.symmetric(horizontal: _screenSize.width*0.17),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              content: SizedBox(
                width: _screenSize.width*0.3,
                height: _screenSize.height*0.2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.lock,color: white,size: 50,),
                    // SizedBox(height: 20,),
                    Text("Press $unlock more times to unlock",style: TextStyle(color: white, fontSize: 15,),textAlign: TextAlign.center,)
                  ],
                ),
              ),
            );
          });
    } else if(_unlockCount==5){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => UnlockedHomeScreen(tiles: example1,)));
    }
  }

  resetLock(){
    _unlockCount=0;
  }
}

import 'package:cboard_mobile/data/data.dart';
import 'package:cboard_mobile/lockedScreen/widgets/color_board.dart';
import 'package:cboard_mobile/lockedScreen/widgets/create_tile.dart';
import 'package:cboard_mobile/shared/button.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';

Future<void> editDialog(BuildContext context) async {
  List<Color> textColor = [
    dark_blue,
    dark_lime_green,
    vivid_yellow,
    soft_red,
    soft_violet,
    soft_orange,
    bright_red
  ];
  String currentFont = "Comic Sans MS";

  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
            child: DefaultTabController(
          length: 2,
          child: SimpleDialog(
            children: [
              TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: white.withAlpha(0),
                tabs: [
                  Text("TILE"),
                  Text("FOLDER"),
                ],
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back_ios),
                      ),
                      Text("Appearance"),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                  Center(
                    child: CreateTile(
                        tile: Tile(
                            isFile: true,
                            name: 'Label',
                            imageUrl: 'assets/images/test.png'),
                        size: 120),
                  ),
                  ListTile(
                    title: Text("Font"),
                    subtitle: Text(currentFont),
                    trailing: IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {}, //Update Provider
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Text',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  ColorBoard(
                    colors: textColor,
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Background',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  ColorBoard(
                    colors: textColor,
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Button(
                      label: Text(
                        "Update",
                      ),
                      isPrimary: true,
                      onPress: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
      });
}

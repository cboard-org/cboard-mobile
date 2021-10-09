import 'package:cboard_mobile/models/dialog.dart';
import 'package:cboard_mobile/shared/button.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'color_board.dart';
import 'tile.dart';

class EditAppearance extends StatefulWidget {
  final String type;
  const EditAppearance(this.type);

  @override
  _EditMain createState() => _EditMain();
}

class _EditMain extends State<EditAppearance> {
  Color currentTextColor;
  Color currentBackgroundColor;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final dialogModel = Provider.of<DialogModel>(context);
    if (widget.type == 'TILE') {
      //Initial values of background color and text color are according to value in Provider
      currentBackgroundColor = dialogModel.tileBackgroundColor;
      currentTextColor = dialogModel.tileTextColor;
    } else {
      currentBackgroundColor = dialogModel.folderBackgroundColor;
      currentTextColor = dialogModel.folderTextColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final dialogModel = Provider.of<DialogModel>(context);
    final String currentFont = "Comic Sans MS";
    List<Color> textColor = [
      dark_blue,
      dark_lime_green,
      vivid_yellow,
      soft_red,
      soft_violet,
      soft_orange,
      bright_red
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 50,
            ),
            Text("Appearance"),
            IconButton(
              onPressed: () {
                dialogModel.updateState(2);
              },
              icon: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),

        //Example tile
        Center(
          child: SizedBox(
            height: 100,
            width: 100,
            child: TileWidget(
              labelPos: dialogModel.labelTop,
              color: currentBackgroundColor,
              text: 'Label',
              content: 'assets/symbols/A.svg',
            ),
          ),
        ),

        //Select font
        ListTile(
          title: Text("Font"),
          subtitle: Text(currentFont),
          trailing: IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () {}, //Update Provider
          ),
        ),

        //Select text color
        ListTile(
          title: Container(
            padding: EdgeInsets.only(bottom: 16),
            child: Text(
              'Text',
              style: TextStyle(fontSize: 16),
            ),
          ),
          subtitle: ColorBoard(
            colors: textColor,
            currentColor: currentTextColor,
            colorChange: (Color newColor) {
              setState(() {
                currentTextColor = newColor;
              });
            },
          ),
        ),

        //Select background color
        ListTile(
          title: Container(
            padding: EdgeInsets.only(bottom: 16),
            child: Text(
              'Background',
              style: TextStyle(fontSize: 16),
            ),
          ),
          subtitle: ColorBoard(
            colors: textColor,
            currentColor: currentBackgroundColor,
            colorChange: (Color newColor) {
              setState(
                () {
                  currentBackgroundColor = newColor;
                },
              );
            },
          ),
        ),

        Spacer(),

        //Button 'Update'
        Center(
          child: Button(
            label: Text(
              "Update",
            ),
            isPrimary: true,
            onPress: () {
              if (widget.type == 'TILE') {
                dialogModel.updateTileBackgroundColor(currentBackgroundColor);
                dialogModel.updateTileTextColor(currentTextColor);
              } else {
                dialogModel.updateFolderBackgroundColor(currentBackgroundColor);
                dialogModel.updateFolderTextColor(currentTextColor);
              }
              Navigator.pop(context);
            },
          ),
        ),

        Spacer(),
      ],
    );
  }
}

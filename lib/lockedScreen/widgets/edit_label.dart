import 'package:cboard_mobile/lockedScreen/widgets/tile.dart';
import 'package:cboard_mobile/models/dialog.dart';
import 'package:cboard_mobile/shared/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditLabel extends StatefulWidget {
  final String type;

  const EditLabel({Key key, this.type}) : super(key: key);
  @override
  _EditLabel createState() => _EditLabel();
}

class _EditLabel extends State<EditLabel> {
  bool labelPos;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final dialogModel = Provider.of<DialogModel>(context);
    labelPos = dialogModel.labelTop;
  }

  @override
  Widget build(BuildContext context) {
    var dialogModel = Provider.of<DialogModel>(context);

    Color currentBackgroundColor = dialogModel.tileBackgroundColor;

    return Column(
      children: <Widget>[
        //Navigation section
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                dialogModel.updateState(2);
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            Text("Label"),
            SizedBox(
              width: 50,
            ),
          ],
        ),

        //Show tile position examples
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Bottom position
            Column(
              children: [
                Text("Bottom"),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Tile(
                    labelPos: false,
                    color: currentBackgroundColor,
                    text: 'Label',
                    content: 'assets/symbols/A.svg',
                  ),
                ),
                Radio(
                  value: false,
                  groupValue: labelPos,
                  onChanged: (bool newValue) {
                    setState(() {
                      labelPos = newValue;
                    });
                  },
                )
              ],
            ),

            //Top position
            Column(
              children: [
                Text("Top"),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Tile(
                    labelPos: true,
                    color: currentBackgroundColor,
                    text: 'Label',
                    content: 'assets/symbols/A.svg',
                  ),
                ),
                Radio(
                  value: true,
                  groupValue: labelPos,
                  onChanged: (bool newValue) {
                    setState(() {
                      labelPos = newValue;
                    });
                  },
                )
              ],
            ),
          ],
        ),

        // 'Update'button
        Button(
          label: Text(
            "Update",
          ),
          isPrimary: true,
          onPress: () {
            //Update label position in Provider
            dialogModel.updatelabelPos(labelPos);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
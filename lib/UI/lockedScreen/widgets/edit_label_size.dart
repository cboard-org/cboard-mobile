import 'package:cboard_mobile/Providers/locked/dialog.dart';
import 'package:cboard_mobile/sharedWidgets/button.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Set tile/folder text size. TODO: implement function to change the size of the text (currently not available)
class EditLabelSize extends StatefulWidget {
  final String type;

  const EditLabelSize({Key key, this.type}) : super(key: key);

  @override
  _EditLabelSize createState() => _EditLabelSize();
}

class _EditLabelSize extends State<EditLabelSize> {
  labelSize currentLabelSize;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final dialogModel = Provider.of<DialogModel>(context);
    if (widget.type == "TILE") {
      //Initial value of label size is from Provider
      currentLabelSize = dialogModel.currentTileLabelSize;
    } else {
      currentLabelSize = dialogModel.currentFolderLabelSize;
    }
  }

  @override
  Widget build(BuildContext context) {
    final dialogModel = Provider.of<DialogModel>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Navigation bar
            IconButton(
              onPressed: () {
                dialogModel.updateState(1);
              },
              icon: Icon(Icons.arrow_back_ios),
            ),

            Text("Label Size"),

            IconButton(
              onPressed: () {
                dialogModel.updateState(3);
              },
              icon: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),

        //Set of list tiles for different sizes

        //Size small
        ListTile(
          title: Text("Small"),
          trailing: Radio<labelSize>(
              activeColor: pure_violet,
              value: labelSize.Small,
              groupValue: currentLabelSize,
              onChanged: (newLabelSize) {
                setState(() {
                  currentLabelSize = newLabelSize;
                });
              }),
        ),

        //Size medium
        ListTile(
          title: Text("Medium"),
          trailing: Radio<labelSize>(
              activeColor: pure_violet,
              value: labelSize.Medium,
              groupValue: currentLabelSize,
              onChanged: (newLabelSize) {
                setState(() {
                  currentLabelSize = newLabelSize;
                });
              }),
        ),

        //Size large
        ListTile(
          title: Text("Large"),
          trailing: Radio<labelSize>(
              activeColor: pure_violet,
              value: labelSize.Large,
              groupValue: currentLabelSize,
              onChanged: (newLabelSize) {
                setState(() {
                  currentLabelSize = newLabelSize;
                });
              }),
        ),

        //Size extra large
        ListTile(
          title: Text("Extra Large"),
          trailing: Radio<labelSize>(
              activeColor: pure_violet,
              value: labelSize.Extra_large,
              groupValue: currentLabelSize,
              onChanged: (newLabelSize) {
                setState(() {
                  currentLabelSize = newLabelSize;
                });
              }),
        ),

        //'Update' button
        Button(
          label: Text("Update"),
          isPrimary: true,
          onPress: () {
            //Update in Provider
            if (widget.type == "TILE") {
              dialogModel.updateTileLabelSize(currentLabelSize);
            } else {
              dialogModel.updateFolderLabelSize(currentLabelSize);
            }
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

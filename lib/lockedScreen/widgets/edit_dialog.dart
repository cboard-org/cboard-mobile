import 'package:cboard_mobile/lockedScreen/screens/dialog_state.dart';
import 'package:cboard_mobile/models/dialog.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Show dialog for editting tile layout
Future<void> editDialog(BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        int currentState =
            context.select<DialogModel, int>((dialog) => dialog.currentState);
        return Center(
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            child: DefaultTabController(
              length: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: white.withAlpha(0),
                        tabs: [
                          Text("TILE"),
                          Text("FOLDER"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: (currentState == 1)
                        ? 450
                        : (currentState == 2)
                            ? 350
                            : 300,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TabBarView(
                      children: [
                        DialogState(type: "TILE"),
                        DialogState(type: "FOLDER"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

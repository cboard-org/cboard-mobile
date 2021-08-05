import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:cboard_mobile/unlocked/ManageBoards.dart';
import 'package:cboard_mobile/unlocked/UnlockedHomepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewBoard extends StatefulWidget {
  @override
  _NewBoardState createState() => _NewBoardState();
}

bool _switchValue = true;

class _NewBoardState extends State<NewBoard> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenSize.height) / 15,
        child: AppBar(
          leading: GestureDetector(
            onTap: () => {
              Navigator.pop(context),
            },
            child: Icon(Icons.arrow_back, color: white, size: 25.0),
          ),
          centerTitle: true,
          title: Text(
              "New Board"), // Debug: Change title to keep track of how many tiles
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/card_placeholder.png',
                height: 200,
                width: 200,
              ),
              ListTile(
                title: Text("Board Name"),
                subtitle: Text("Board1 "),
                trailing: Icon(Icons.navigate_next),
              ),
              ListTile(
                title: Text("Availability"),
                subtitle: Text("Public"),
                trailing: Icon(Icons.navigate_next),
              ),
              ListTile(
                title: Text("Display Layout"),
                subtitle: Text("Board1 "),
                trailing: Icon(Icons.navigate_next),
                onTap: () => {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Wrap(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                            child: Column(children: [RadioGroup()]),
                          ),
                        ],
                      );
                    },
                  ),
                },
              ),
              ListTile(
                title: Text("Save to cloud"),
                subtitle: Text(
                    "Saving to Cloud allows all tiles in the Board to be accessible even when the device is offline."),
                trailing: CupertinoSwitch(
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.center,
                child: RaisedButton(
                  color: paua,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  padding:
                      EdgeInsets.only(top: 10, left: 65, right: 65, bottom: 10),
                  onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ManageBoardsScreen()))
                  }, //
                  child: Text(
                    "Create",
                    style: TextStyle(fontSize: 18.0, color: white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RadioGroup extends StatefulWidget {
  @override
  RadioGroupWidget createState() => RadioGroupWidget();
}

class LayoutOptions {
  String number;
  int index;
  String img;
  LayoutOptions({this.number, this.index, this.img});
}

class RadioGroupWidget extends State {
  // Group Value for Radio Button.
  int id = 1;

  List<LayoutOptions> nList = [
    LayoutOptions(
      index: 1,
      number: "One",
      img: "assets/images/colIcon.png",
    ),
    LayoutOptions(
      index: 2,
      number: "Two",
      img: "assets/images/colIcon.png",
    ),
    LayoutOptions(
      index: 3,
      number: "Three",
      img: "assets/images/colIcon.png",
    ),
    LayoutOptions(
      index: 4,
      number: "Four",
      img: "assets/images/colIcon.png",
    ),
  ];

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 350.0,
          child: Column(
            children: nList
                .map((data) => RadioListTile(
                      title: Row(children: [
                        Text("${data.number}"),
                        SizedBox(
                          width: 20,
                        ),
                        data.number == "One"
                            ? Image.asset("${data.img}")
                            : data.number == "Two"
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset("${data.img}"),
                                      Image.asset("${data.img}"),
                                    ],
                                  )
                                : data.number == "Three"
                                    ? Row(
                                        children: [
                                          Image.asset("${data.img}"),
                                          Image.asset("${data.img}"),
                                          Image.asset("${data.img}")
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          Image.asset("${data.img}"),
                                          Image.asset("${data.img}"),
                                          Image.asset("${data.img}"),
                                          Image.asset("${data.img}")
                                        ],
                                      ),
                      ]),
                      groupValue: id,
                      value: data.index,
                      onChanged: (val) {
                        setState(() {
                          id = data.index;
                        });
                      },
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

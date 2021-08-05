import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';

import 'UnlockedHomepage.dart';

class PublicBoards extends StatefulWidget {
  @override
  _PublicBoardsState createState() => _PublicBoardsState();
}

class Items {
  String title;
  String img;

  Items({
    this.title,
    this.img,
  });
}

class _PublicBoardsState extends State<PublicBoards> {
  Items item1 = new Items(
    title: "Yes",
    img: "assets/images/yes.png",
  );

  Items item2 = new Items(
    title: "No",
    img: "assets/images/no.png",
  );

  Items item3 = new Items(
    title: "School",
    img: "assets/images/school.png",
  );
  Items item4 = new Items(
    title: "Time",
    img: "assets/images/time.png",
  );
  Items item5 = new Items(
    title: "Food",
    img: "assets/images/food.png",
  );
  @override
  Widget build(BuildContext context) {
    List<Items> myList = [
      item1,
      item2,
      item3,
      item4,
      item5,
    ];
    final Size screenSize = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenSize.height) / 15,
        child: AppBar(
          leading: GestureDetector(
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UnlockedHomeScreen()))
            },
            child: Icon(Icons.arrow_back, color: white, size: 25.0),
          ),
          centerTitle: true,
          title: Text(
              "Public Boards"), // Debug: Change title to keep track of how many tiles
        ),
      ),
      body: Container(
        child: GridView.builder(
          itemCount: myList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (orientation == Orientation.portrait) ? 3 : 4),
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              color: light_purple,
              child: new GridTile(
                footer: Container(
                  color: Colors.white60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(myList[index].title),
                  ),
                ),
                child: Image.asset(myList[index]
                    .img), //just for testing, will fill with image later
              ),
            );
          },
        ),
      ),
    );
  }
}

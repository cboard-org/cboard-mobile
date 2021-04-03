import 'package:flutter/material.dart';
// import 'widgets.dart';
import 'package:overlay_screen/overlay_screen.dart';

class MainAppBar extends StatelessWidget {
  final double scrollOffset;

  const MainAppBar({
    Key key,
    this.scrollOffset = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OverlayScreen().saveScreens({
      'display': CustomOverlayScreen(
        backgroundColor: Colors.transparent,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 400,
              width: 300,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Display",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.purple, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Divider(
                      color: Colors.purple,
                      height: 20,
                      thickness: 1,
                    ),
                    Card(
                      child: ListTile(
                          leading: FlutterLogo(),
                          title: Text('One Column'),
                          trailing: Icon(Icons.adjust),
                          onTap: () {/* react to the tile being tapped */}),
                    ),
                    Card(
                      child: ListTile(
                          leading: FlutterLogo(),
                          title: Text('Two Columns'),
                          trailing: Icon(Icons.adjust),
                          onTap: () {/* react to the tile being tapped */}),
                    ),
                    Card(
                      child: ListTile(
                          leading: FlutterLogo(),
                          title: Text('Three Columns'),
                          trailing: Icon(Icons.adjust),
                          onTap: () {/* react to the tile being tapped */}),
                    ),
                    Card(
                      child: ListTile(
                          leading: FlutterLogo(),
                          title: Text('Four Columns'),
                          trailing: Icon(Icons.adjust),
                          onTap: () {/* react to the tile being tapped */}),
                    ),
                    FlatButton(
                      color: Colors.purple,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.purple,
                      onPressed: () {
                        /*...*/
                      },
                      child: Text(
                        "UPDATE",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      'custom2': CustomOverlayScreen(
        backgroundColor: Colors.yellow[400],
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 80.0,
            ),
            Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text("Let's start!"))
          ],
        ),
      ),
    });
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,
      ),
      color: Theme.of(context).primaryColor,
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Readability Settings
                GestureDetector(
                  onTap: () async {
                    OverlayScreen().show(
                      context,
                      identifier: 'display',
                    );
                  },
                  child: Icon(
                    Icons.apps,
                    color: Colors.white,
                    size: 25.0,
                  ),
                ),
                // Board Name
                Text(
                  'Board Name',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                // Lock
                GestureDetector(
                  onTap: () => print('Lock'), // insert new screen here
                  child: Icon(
                    Icons.lock,
                    color: Colors.white,
                    size: 25.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

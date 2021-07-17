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
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              height: 200,
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    Card(
                      child: ListTile(
                          leading: Icon(
                            Icons.assignment,
                            color: Theme.of(context).primaryColor,
                            size: 30.0,
                          ),
                          title: Text('Board One'),
                          onTap: () => print('Board Clicked')),
                    ),
                    Card(
                      child: ListTile(
                          leading: Icon(
                            Icons.assignment,
                            color: Theme.of(context).primaryColor,
                            size: 30.0,
                          ),
                          title: Text('Board Two'),
                          onTap: () => print('Board Clicked')),
                    ),
                    Card(
                      child: ListTile(
                          leading: Icon(
                            Icons.backup,
                            color: Theme.of(context).primaryColor,
                            size: 30.0,
                          ),
                          title: Text('Board Three'),
                          onTap: () => print('Board Clicked')),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      'edit_home': CustomOverlayScreen(
        backgroundColor: Colors.transparent,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(

            ),
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
                      identifier: 'edit_home',
                    );
                  },
                  child: Icon(
                    Icons.filter_none,
                    color: Colors.white,
                    size: 25.0,
                  ),
                ),
                // Board Name
                GestureDetector(
                  onTap: () async {
                    OverlayScreen().show(
                      context,
                      identifier: 'display',
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Board Name",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        WidgetSpan(
                          child: Icon(
                            Icons.arrow_drop_down,
                            size: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Lock
                GestureDetector(
                  onTap: () => print('Lock'), // insert new homescreen here
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

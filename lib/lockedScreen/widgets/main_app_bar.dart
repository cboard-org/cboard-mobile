import 'package:cboard_mobile/lockedScreen/widgets/edit_dialog.dart';
import 'package:cboard_mobile/models/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainAppBar extends StatelessWidget {
  final double scrollOffset;

  const MainAppBar({
    Key key,
    this.scrollOffset = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //List of boards
    final List<ListTile> boards = <ListTile>[
      ListTile(
          leading: Icon(
            Icons.assignment,
            color: Theme.of(context).primaryColor,
            size: 30.0,
          ),
          title: Text('Board One'),
          onTap: () => print('Board Clicked')),
      ListTile(
          leading: Icon(
            Icons.assignment,
            color: Theme.of(context).primaryColor,
            size: 30.0,
          ),
          title: Text('Board Two'),
          onTap: () => print('Board Clicked')),
      ListTile(
          leading: Icon(
            Icons.backup,
            color: Theme.of(context).primaryColor,
            size: 30.0,
          ),
          title: Text('Board Three'),
          onTap: () => print('Board Clicked')),
    ];

    //Create bottom sheet
    void _showBottomSheet() => showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: 170,
              child: Column(
                children: boards,
              ),
            );
          },
        );

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
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
                  onTap: () {
                    editDialog(context);
                  },
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 25.0,
                  ),
                ),
                // Board Name
                SizedBox(
                  height: 35,
                  child: TextButton(
                    onPressed: () => _showBottomSheet(),
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
                ),
                // Lock
                GestureDetector(
                  onTap: () => Provider.of<HomeModel>(context,listen:false).tapUnlock(context), // insert new homescreen here
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

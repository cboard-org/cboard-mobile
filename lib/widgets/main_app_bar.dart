import 'package:flutter/material.dart';
import 'widgets.dart';

class MainAppBar extends StatelessWidget {
  final double scrollOffset;

  const MainAppBar({
    Key key,
    this.scrollOffset = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  onTap: () => print('Setting'),
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
                  onTap: () => print('Lock'),
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

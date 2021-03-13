import 'package:cboard_mobile/unlocked/EditTile.dart';
import 'package:flutter/material.dart';
import 'package:cboard_mobile/data/data.dart';

class TileName extends StatefulWidget {
  final Tile tile;

  const TileName({Key key, this.tile}) : super(key: key);
  @override
  _TileNameState createState() => _TileNameState();
}

class _TileNameState extends State<TileName> {
  ScrollController _scrollController;
  double _scrollOffset = 0.0;
  bool lock = false;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    TextEditingController nameController = TextEditingController()
      ..text = widget.tile.name;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenSize.height) / 15,
        child: AppBar(
          leading: GestureDetector(
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditTileScreen(tile: widget.tile))),
            },
            child: Icon(Icons.arrow_back, color: Colors.white, size: 25.0),
          ),
          centerTitle: true,
          title: Text(
              'Tile Name'), // Debug: Change title to keep track of how many tiles
        ),
      ),
      body: TextField(
        controller: nameController,
        decoration: InputDecoration(border: InputBorder.none),
      ),
    );
  }
}

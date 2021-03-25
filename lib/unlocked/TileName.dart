import 'package:flutter/material.dart';

class TileName extends StatefulWidget {
  final String tilename;

  const TileName({Key key, this.tilename}) : super(key: key);
  @override
  _TileNameState createState() => _TileNameState();
}

class _TileNameState extends State<TileName> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController()
      ..text = widget.tilename;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height) / 15,
        child: AppBar(
          leading: GestureDetector(
            onTap: () => {Navigator.pop(context)},
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

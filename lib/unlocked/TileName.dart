import 'package:flutter/material.dart';
import 'package:cboard_mobile/shared/app-bar.dart';

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
        child: BaseAppBar(
          leading: GestureDetector(
            onTap: () => {Navigator.pop(context)},
            child: Icon(Icons.arrow_back, color: Colors.white, size: 25.0),
          ),
          title: Text('Tile Name'),
        ),
      ),
      body: TextField(
        controller: nameController,
        decoration: InputDecoration(border: InputBorder.none),
      ),
    );
  }
}

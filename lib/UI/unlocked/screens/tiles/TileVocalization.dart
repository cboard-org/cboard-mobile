import 'package:flutter/material.dart';

class TileVocalization extends StatefulWidget {
  final String tileVocalization;

  const TileVocalization({Key key, this.tileVocalization}) : super(key: key);

  @override
  _TileVocalizationState createState() => _TileVocalizationState();
}

class _TileVocalizationState extends State<TileVocalization> {
  @override
  Widget build(BuildContext context) {
    TextEditingController vocalControllers = TextEditingController()
      ..text = widget.tileVocalization;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height) / 15,
        child: AppBar(
          leading: GestureDetector(
            onTap: () => {
              Navigator.pop(context),
            },
            child: Icon(Icons.arrow_back, color: Colors.white, size: 25.0),
          ),
          centerTitle: true,
          title: Text(
              'Tile Vocalization'), // Debug: Change title to keep track of how many tiles
        ),
      ),
      body: TextField(
        controller: vocalControllers,
        decoration: InputDecoration(border: InputBorder.none),
      ),
    );
  }
}

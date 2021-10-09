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
    nameController.selection=TextSelection.fromPosition(TextPosition(offset: nameController.text.length));

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
      body: Container(
        padding: EdgeInsets.all(20),
        child: TextField(
          controller: nameController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            focusColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.edit,color: Theme.of(context).primaryColor,),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
              // borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:cboard_mobile/unlocked/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cboard_mobile/data/data.dart';

class ManageBoards extends StatefulWidget {
  const ManageBoards({Key key}) : super(key: key);
  @override
  _ManageBoardsScreenState createState() => _ManageBoardsScreenState();
}

class _ManageBoardsScreenState extends State<ManageBoards> {
  ScrollController _scrollController;
  double _scrollOffset = 0.0;

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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height) / 15,
        child: BaseAppBar(
          leading: GestureDetector(
            onTap: () => {Navigator.pop(context)},
            child: Icon(Icons.arrow_back, color: Colors.white, size: 25.0),
          ),
          title: Text('Voice Recorder'),
        ),
      ),
      body: Container(
        child: GridView.count(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 7.0,
          ),
          crossAxisCount: 3,
          children: example.map((item) {
            return Tiles(tile: item);
          }).toList(),
        ),
      ),
    );
  }
}

import 'package:cboard_mobile/widgets/widgets.dart';
// import 'package:cboard_mobile/data/data.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 146.0),
        child: Container(
          color: Colors.white,
          height: 145,
          margin: EdgeInsets.only(
              top: 50.0), // avoid overlapping with phone's top display stuff
          child: Column(
            children: <Widget>[
              SentenceBar(), // Sentence Creation Section
              MainAppBar(scrollOffset: _scrollOffset), // Main Navigation Bar
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
      ),
    );
  }
}

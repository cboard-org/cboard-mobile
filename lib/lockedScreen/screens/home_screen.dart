import 'package:flutter/material.dart';
import 'package:cboard_mobile/data/data.dart';
import '../widgets/main_app_bar.dart';
import '../widgets/sentence_bar.dart';

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
      // extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 156.0),
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.only(
              top: 25.0), // avoid overlapping with phone's top display stuff
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SentenceBar(), // Sentence Creation Section
              MainAppBar(scrollOffset: _scrollOffset), // Main Navigation Bar
            ],
          ),
        ),
      ),
      body: Container(
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 7.0,
          ),
          itemCount: example.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            final Tile tile = example[index];
            return createTile(tile, 120.0);
          },
        ),
      ),
    );
  }

  //Create tile
  Widget createTile(Tile tile, double size) {
    return GestureDetector(
      onTap: () {
        setState(() {
          SentenceBar.words.add(tile);
          print(SentenceBar.words);
        });
      },
      child: Stack(
        // alignment: Alignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 3.0),
            height: size,
            width: size,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(tile.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 60,
            child: SizedBox(
              height: 20.0,
              child: Text(
                tile.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

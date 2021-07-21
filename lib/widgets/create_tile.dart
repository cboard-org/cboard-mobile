import 'package:flutter/material.dart';
import 'package:cboard_mobile/data/data.dart';

class CreateTile extends StatelessWidget {
  final Tile tile;
  final double size;

  const CreateTile({Key key, @required this.tile, @required this.size})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print(tile.name),
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

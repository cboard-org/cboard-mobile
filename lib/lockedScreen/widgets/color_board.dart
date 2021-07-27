import 'package:cboard_mobile/lockedScreen/widgets/circle_color.dart';
import 'package:flutter/widgets.dart';

class ColorBoard extends StatefulWidget {
  final List<Color> colors;

  const ColorBoard({
    Key key,
    @required this.colors,
  }) : super(key: key);
  @override
  _ColorBoard createState() => _ColorBoard();
}

class _ColorBoard extends State<ColorBoard> {
  Color currentColor;

  @override
  void initState() {
    super.initState();
    currentColor = widget.colors[0]; // Later fetch from Provider
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: widget.colors.map((color) {
        return new CircleColor(
          color: color,
          isSelected: currentColor == color,
          onColorChoose: (color) {
            setState(() {
              currentColor = color;
            });
          },
        );
      }).toList(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//Board of colors so user can change tile/folder color in dialog_state
class ColorBoard extends StatelessWidget {
  final List<Color> colors;
  final void Function(Color) colorChange;
  final Color currentColor;

  const ColorBoard({
    Key key,
    @required this.colors,
    @required this.colorChange,
    @required this.currentColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double circleSize = 20;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: colors.map((color) {
        return Material(
          shape: const CircleBorder(),
          child: GestureDetector(
            //User taps will update value on the screen, not yet in Provider
            onTap: () => colorChange(color),
            child: CircleAvatar(
              radius: circleSize * 2 / 3,
              backgroundColor: color,
              child: currentColor == color
                  ? Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 15,
                    )
                  : null,
            ),
          ),
        );
      }).toList(),
    );
  }
}

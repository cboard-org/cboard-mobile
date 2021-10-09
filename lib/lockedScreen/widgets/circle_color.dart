import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';

typedef ColorChange = void Function(Color);

class CircleColor extends StatelessWidget {
  final bool isSelected;
  final Color color;
  final ColorChange onColorChoose;
  final double circleSize;
  final IconData iconSelected;

  const CircleColor({
    Key key,
    @required this.color,
    this.circleSize = 20,
    this.onColorChoose,
    this.isSelected = false,
    this.iconSelected = Icons.check,
  })  : assert(color != null, "You must provide a not null Color"),
        assert(circleSize != null, "CircleColor must have a not null size"),
        assert(circleSize >= 0, "You must provide a positive size"),
        assert(!isSelected || (isSelected && iconSelected != null)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onColorChoose(color),
      child: Material(
        shape: const CircleBorder(),
        child: CircleAvatar(
          radius: circleSize * 2 / 3,
          backgroundColor: color,
          child: isSelected
              ? Icon(
                  iconSelected,
                  color: white,
                  size: 15,
                )
              : null,
        ),
      ),
    );
  }
}

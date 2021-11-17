import 'package:cboard_mobile/UI/lockedScreen/data.dart';
import 'package:cboard_mobile/UI/lockedScreen/screens/home_screen.dart';
import 'package:cboard_mobile/sharedWidgets/button.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:cboard_mobile/stylesheets/typography.dart' as CustomTypography;
import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  final String username;

  const CustomContainer({Key key, this.username}) : super(key: key);

  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      child: CustomPaint(
          painter: CloudPainter(
              screenHeight: screenHeight, screenWidth: screenWidth),
          child: Container(
            child: Column(
              children: [
                Text(
                  "Welcome,\n",
                  style: CustomTypography.Typography.header(),
                ),
                Text(
                  widget.username,
                  style: CustomTypography.Typography.header(),
                ),
                Text(
                  "\nYour account has been created",
                  style: CustomTypography.Typography.subheader(),
                ),
                Text(
                  "successfully.",
                  style: CustomTypography.Typography.subheader(),
                ),
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Button(
                    label: Text('DONE'),
                    padding: 50,
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen(
                                  data: defaultBoards,
                                  folderId: "root",
                                )),
                      );
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class CloudPainter extends CustomPainter {
  double screenWidth, screenHeight;

  CloudPainter({screenWidth, screenHeight});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint();

    paint.color = white;
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(Offset(-70, 70), 150, paint);
    canvas.drawCircle(Offset(140, 100), 150, paint);
    canvas.drawCircle(Offset(280, 20), 90, paint);
    canvas.drawRect(Offset(-200, 0) & Size(800, 300), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

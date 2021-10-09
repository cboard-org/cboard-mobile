import 'package:cboard_mobile/onboarding/screens/welcome.dart';
import 'package:cboard_mobile/shared/button.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';
import 'package:cboard_mobile/stylesheets/typography.dart' as CustomTypography;

class CustomContainer extends StatefulWidget {
  final String username;
  const CustomContainer({ Key key, this.username }) : super(key: key);

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
        painter: CloudPainter(screenHeight: screenHeight,screenWidth: screenWidth),
        child: Container(
          child: Column(
            children: [
              Text("Welcome,\n",
                style: CustomTypography.Typography.header(),
              ),
              Text(widget.username,
                style: CustomTypography.Typography.header(),
              ),
              Text("\nYour account has been created",
                style: CustomTypography.Typography.subheader(),
              ),
              Text("successfully.",
                style: CustomTypography.Typography.subheader(),
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Button(
                  label: Text('DONE'),
                  padding: 50,
                  onPress: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()));
                  },
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}

class CloudPainter extends CustomPainter{
  double screenWidth, screenHeight;
  CloudPainter({screenWidth, screenHeight});
  @override
  void paint(Canvas canvas, Size size){
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

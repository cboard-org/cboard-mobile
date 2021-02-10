import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:cboard_mobile/stylesheets/typography.dart' as CustomTypography;
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        child: Column(
          children: [
            Container(
              child: Image.asset('assets/images/logo.png', scale: 0.75),
              margin: EdgeInsets.only(bottom: 20),
            ),
            Container(
              child: Text(
                'C-Board',
                style: CustomTypography.Typography.header(),
              ),
              margin: EdgeInsets.only(bottom: 10),
            ),
            Text(
              'Giving every child a voice',
              style: CustomTypography.Typography.subheader(),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 3,
              offset: Offset(0, 1),
            ),
          ],
        ),
      ),
    );
  }
}

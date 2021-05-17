import 'package:flutter/material.dart';
import 'package:medhealth/theme.dart';

class WidgetIlustration extends StatelessWidget {
  final Widget child;
  final String image;
  final String title;
  final String subtitle;
  final String subtitle2;
  WidgetIlustration(
      {this.child, this.image, this.title, this.subtitle, this.subtitle2});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          width: 250,
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          title,
          style: regulerTextStyle.copyWith(fontSize: 25),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 16,
        ),
        Column(
          children: [
            Text(
              subtitle,
              style: regulerTextStyle.copyWith(
                  fontSize: 15, color: greyLightColor),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              subtitle2,
              style: regulerTextStyle.copyWith(
                  fontSize: 15, color: greyLightColor),
            ),
            SizedBox(
              height: 40,
            ),
            child ?? SizedBox(),
          ],
        )
      ],
    );
  }
}

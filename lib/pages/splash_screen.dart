import 'package:flutter/material.dart';
import 'package:medhealth/pages/register_page.dart';
import 'package:medhealth/widget/button_primary.dart';
import 'package:medhealth/widget/general_logo_space.dart';
import 'package:medhealth/widget/widget_ilustration.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GeneralLogoSpace(
        child: Column(
          children: [
            SizedBox(
              height: 45,
            ),
            WidgetIlustration(
              image: "assets/splash_ilustration.png",
              title: "Find your medical\nsolution",
              subtitle: "Consultant with a doctor",
              subtitle2: "whenever and wheneve you want",
              child: ButtonPrimary(
                text: "GET STARTED",
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ristek_ic/main/presentation/pages/main_screen.dart';
import '../../../app.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      nav.pushReplacement<MainScreen, Widget>(const MainScreen());
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_ristek.png',
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            Text(
              "Ristek IC: Routing and Navigation",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.purple.shade900,
                letterSpacing: 2.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

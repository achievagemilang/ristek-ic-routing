import 'package:flutter/material.dart';

import 'main/presentation/pages/splash_screen.dart';
import 'services/navigations/_navigations.dart';

final nav = NavigationService();

void main() => runApp(App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: nav.navigatorKey,
      routes: nav.routes,
      home: const SplashScreen(),
    );
  }
}

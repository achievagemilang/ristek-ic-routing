import 'package:flutter/material.dart';
import 'package:ristek_ic/features/presentation/pages/profile_screen.dart';

import '../../../app.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Home',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purple.shade900,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    nav.push(const DetailsScreen());
                  },
                  child: const Text('Go to Details'),
                ),
                ElevatedButton(
                  onPressed: () {
                    nav.push(const ProfileScreen());
                  },
                  child: const Text('Go to Profile'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

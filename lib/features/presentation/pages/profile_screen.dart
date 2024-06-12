import 'package:flutter/material.dart';

import '../../../app.dart';
import 'detail_screen.dart';
import 'home_screen.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Profile',
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
                    nav.push(const HomeScreen());
                  },
                  child: const Text('Go to Home'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ristek_ic/features/presentation/pages/profile_screen.dart';

import '../../../app.dart';
import 'home_screen.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = '/details';
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Details',
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
                    nav.push(const HomeScreen());
                  },
                  child: const Text('Go to Home'),
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

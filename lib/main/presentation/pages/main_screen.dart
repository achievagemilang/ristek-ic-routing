import 'package:flutter/material.dart';
import 'package:ristek_ic/features/presentation/pages/profile_screen.dart';

import 'package:ristek_ic/widgets/atoms/navigation_item.dart';
import 'package:ristek_ic/widgets/molecules/bottom_navbar.dart';
import '../../../features/presentation/pages/detail_screen.dart';
import '../../../features/presentation/pages/home_screen.dart';
import '../../../widgets/molecules/hamburger_drawer.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = '/main';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final PageStorageBucket _bucket = PageStorageBucket();

  final List<Widget> _pages = [
    const HomeScreen(
      key: PageStorageKey('HomeScreen'),
    ),
    const DetailsScreen(
      key: PageStorageKey('DetailsScreen'),
    ),
    const ProfileScreen(
      key: PageStorageKey('ProfileScreen'),
    )
  ];

  void _selectTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Main Screen',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      drawer: HamburgerDrawer(
        onTap: _selectTab,
        items: const [
          NavigationItem(
            label: 'Home',
            assetPath: "assets/images/home.svg",
          ),
          NavigationItem(
            label: 'Details',
            assetPath: "assets/images/details.svg",
          ),
          NavigationItem(
            label: 'Profile',
            assetPath: "assets/images/profile.svg",
          ),
        ],
      ),
      body: ColoredBox(
        color: Colors.white,
        child: SafeArea(
          top: true,
          bottom: true,
          child: ColoredBox(
            color: Colors.white,
            child: PageStorage(
              bucket: _bucket,
              child: IndexedStack(
                index: _selectedIndex,
                children: _pages,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavbar(
        initialActiveIndex: _selectedIndex,
        onTap: _selectTab,
        items: const [
          NavigationItem(
            label: 'Home',
            assetPath: "assets/images/home.svg",
          ),
          NavigationItem(
            label: 'Details',
            assetPath: "assets/images/details.svg",
          ),
          NavigationItem(
            label: 'Profile',
            assetPath: "assets/images/profile.svg",
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

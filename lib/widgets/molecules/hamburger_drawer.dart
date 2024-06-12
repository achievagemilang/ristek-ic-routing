import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../atoms/navigation_item.dart';

class HamburgerDrawer extends StatelessWidget {
  const HamburgerDrawer({
    Key? key,
    required this.onTap,
    required this.items,
  }) : super(key: key);

  final List<NavigationItem> items;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple.shade900,
            ),
            child: const Text(
              'Navigation Drawer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ...items.asMap().entries.map((entry) {
            int index = entry.key;
            NavigationItem item = entry.value;
            return ListTile(
              leading: SvgPicture.asset(
                item.assetPath,
                width: 24,
                height: 24,
                color: Colors.purple.shade900,
              ),
              title: Text(item.label),
              onTap: () {
                Navigator.pop(context);
                // item.label == "Profile"
                //     ? nav.navigateTo(
                //         const ProfileScreen(), ProfileScreen.routeName)
                //     :
                onTap(index);
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}

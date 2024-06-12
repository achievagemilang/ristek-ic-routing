import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ristek_ic/widgets/atoms/navigation_item.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({
    required this.items,
    required this.onTap,
    this.initialActiveIndex = 0,
    super.key,
  });

  final int initialActiveIndex;
  final List<NavigationItem> items;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Material(
        elevation: 8,
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 12,
          ),
          child: Row(
            children: List.generate(
              items.length,
              (index) {
                final isSelected = initialActiveIndex == index;
                return Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => onTap.call(index),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            items[index].assetPath,
                            height: 24,
                            colorFilter: isSelected
                                ? ColorFilter.mode(
                                    Colors.purple.shade900,
                                    BlendMode.srcIn,
                                  )
                                : null,
                          ),
                          const SizedBox(height: 8),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              items[index].label,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ).copyWith(
                                color: isSelected
                                    ? Colors.purple.shade900
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

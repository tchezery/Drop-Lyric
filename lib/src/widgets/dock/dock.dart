import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../app/theme.dart';

class DockItem {
  final IconData icon;
  final IconData? activeIcon;
  final String label;
  final Color? color;
  final Gradient? gradient;
  final VoidCallback? onTap;

  const DockItem({
    required this.icon,
    this.activeIcon,
    required this.label,
    this.color,
    this.gradient,
    this.onTap,
  });
}

class Dock extends StatelessWidget {
  final bool isVisible;
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;
  final List<DockItem> items;
  final double height;
  final double bottomMargin;

  const Dock({
    super.key,
    this.isVisible = true,
    this.selectedIndex = 0,
    required this.onItemSelected,
    required this.items,
    this.height = 76.0,
    this.bottomMargin = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    if (!isVisible) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomMargin),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(36),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
              child: Container(
                height: height,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppTheme.dockDarkBackground
                      : AppTheme.dockLightBackground,
                  borderRadius: BorderRadius.circular(36),
                  border: Border.all(
                    color: isDark
                        ? AppTheme.dockDarkBorder
                        : AppTheme.dockLightBorder,
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: isDark
                          ? AppTheme.dockShadowDark
                          : AppTheme.dockShadowLight,
                      blurRadius: 30,
                      spreadRadius: 2,
                      offset: const Offset(0, 10),
                    ),
                    BoxShadow(
                      color: theme.colorScheme.primary.withValues(alpha: 0.06),
                      blurRadius: 20,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(items.length, (index) {
                    final item = items[index];
                    final isSelected = selectedIndex == index;

                    return _DockItemWidget(
                      item: item,
                      isSelected: isSelected,
                      onTap: () {
                        onItemSelected(index);
                        item.onTap?.call();
                      },
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DockItemWidget extends StatelessWidget {
  final DockItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const _DockItemWidget({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  gradient:
                      item.gradient ??
                      (isSelected
                          ? LinearGradient(
                              colors: [
                                theme.colorScheme.primary,
                                theme.colorScheme.primary.withValues(
                                  alpha: 0.8,
                                ),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )
                          : null),
                  color: item.gradient == null && !isSelected
                      ? (isDark
                            ? Colors.white.withValues(alpha: 0.08)
                            : Colors.black.withValues(alpha: 0.04))
                      : null,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: (item.color ?? theme.colorScheme.primary)
                                .withValues(alpha: 0.35),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : [],
                ),
                child: Center(
                  child: Icon(
                    isSelected ? (item.activeIcon ?? item.icon) : item.icon,
                    size: 22,
                    color: isSelected
                        ? Colors.white
                        : (isDark
                              ? AppTheme.unselectedIconDark
                              : AppTheme.unselectedIconLight),
                  ),
                ),
              ),
              const SizedBox(height: 3),
            ],
          ),
        ),
      ),
    );
  }
}

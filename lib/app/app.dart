import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/widgets/dock/dock.dart';
import 'routes.dart';
import 'theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Droplyric',
      theme: AppTheme.lightTheme,
      navigatorKey: AppRoutes.navigatorKey,
      navigatorObservers: [AppRoutes.routeObserver],
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRoutes.generateRoute,
      builder: (context, child) {
        return Scaffold(
          body: Stack(
            children: [
              child ?? const SizedBox.shrink(),
              ValueListenableBuilder<String>(
                valueListenable: AppRoutes.currentRoute,
                builder: (context, route, _) {
                  final selectedIndex = _getRouteIndex(route);

                  return Dock(
                    selectedIndex: selectedIndex,
                    onItemSelected: (index) {
                      final targetRoute = _getRouteByIndex(index);
                      AppRoutes.navigateTo(targetRoute);
                    },
                    items: const [
                      DockItem(icon: CupertinoIcons.home, label: 'Home'),
                      DockItem(icon: CupertinoIcons.search, label: 'Search'),
                      DockItem(icon: CupertinoIcons.music_albums, label: 'Library'),
                      DockItem(icon: CupertinoIcons.person, label: 'Profile'),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  static int _getRouteIndex(String route) {
    switch (route) {
      case AppRoutes.home:
        return 0;
      case AppRoutes.search:
        return 1;
      case AppRoutes.library:
        return 2;
      case AppRoutes.profile:
        return 3;
      default:
        return 0;
    }
  }

  static String _getRouteByIndex(int index) {
    switch (index) {
      case 0:
        return AppRoutes.home;
      case 1:
        return AppRoutes.search;
      case 2:
        return AppRoutes.library;
      case 3:
        return AppRoutes.profile;
      default:
        return AppRoutes.home;
    }
  }
}

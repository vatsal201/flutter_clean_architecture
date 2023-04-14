import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/features/views/screens/dashboard.dart';

import '../views/screens/splash/splash_screen.dart';
import 'route_paths.dart';

class ERoutes {
  static Route<dynamic>? routes(RouteSettings settings) {
    switch (settings.name) {
      case ERoutePaths.root:
        return CupertinoPageRoute(
          builder: (ctx) => const ESplashScreen(),
          settings: settings,
          title: ERoutePaths.root,
        );
      case ERoutePaths.dashboard:
        return CupertinoPageRoute(
          builder: (ctx) => const DashboardScreen(),
          settings: settings,
          title: ERoutePaths.dashboard,
        );
    }
    return CupertinoPageRoute(
      builder: (ctx) => const ESplashScreen(),
      settings: settings,
      title: ERoutePaths.root,
    );
  }
}

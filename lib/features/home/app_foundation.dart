import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_text.dart';
import 'providers.dart';
import 'route_paths.dart';
import 'routes.dart';

class AppFoundation extends StatelessWidget {
  const AppFoundation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: EProviders.eProviders,
      child: MaterialApp(
        theme: appTheme(context),
        title: AppText.appName,
        debugShowCheckedModeBanner: false,
        initialRoute: ERoutePaths.root,
        onGenerateRoute: ERoutes.routes,
      ),
    );
  }
}

ThemeData appTheme(BuildContext context) {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(fontSize: 18, color: Colors.purple),
    ),
    // Color Scheme
    canvasColor: const Color.fromARGB(255, 251, 245, 247),
    splashColor: Colors.pink[100],
    focusColor: Colors.pink[200],
    hoverColor: Colors.pink[300],
    shadowColor: Colors.pink[900],
    // Typography
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
        fontSize: 40,
      ),
      displayMedium: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.normal,
        fontSize: 30,
      ),
      displaySmall: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
        fontSize: 26,
      ),
      headlineMedium: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.normal,
        fontSize: 26,
      ),
      headlineSmall: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      titleLarge: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      bodyLarge: TextStyle(
        color: Colors.grey[600],
        fontWeight: FontWeight.normal,
        fontSize: 16,
      ),
      bodyMedium: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
        .copyWith(background: Colors.white),
  );
}

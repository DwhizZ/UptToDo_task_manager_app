import 'package:flutter/material.dart';
import 'package:uptodo_app/src/config/routes/route_names.dart';
import 'package:uptodo_app/src/config/routes/route_path.dart';
import 'package:uptodo_app/src/config/themes/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.logoPage,
      routes: RoutePath.routes,
      theme: AppTheme.dark,
    );
  }
}

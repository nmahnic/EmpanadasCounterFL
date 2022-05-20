
import 'package:fl_empanadas_counter/router/app_routes.dart';
import 'package:fl_empanadas_counter/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      // onGenerateRoute: (settings) => AppRoutes.onGenerateRoute(settings)
      //onGenerateRoute: AppRoutes.onGenerateRoute, // lo mismo que de arriba solo cuando hay un parametro
      // theme: AppTheme.lightTheme
      theme: AppTheme.lightTheme
    );
  }
}
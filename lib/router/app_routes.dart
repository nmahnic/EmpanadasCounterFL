import 'package:flutter/material.dart';

import '../models/models.dart';
import '../screens/screens.dart';

class AppRoutes {

  static const initialRoute = '/home';
  static final menuOptions = <MenuOption> [
    // MenuOption(name: 'List1 Screen', route: '/listView1', screen: const ListView1Screen(), icon: Icons.list),
  ];

  static  Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    appRoutes.addAll({'/home': (BuildContext context) => const HomeScreen()});
       
    for (final option in menuOptions) {
      appRoutes.addAll({option.route : (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

}
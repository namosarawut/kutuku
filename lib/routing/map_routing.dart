
import 'package:flutter/material.dart';
import 'package:kutuku/features_screens/home_screen.dart';
import 'package:kutuku/features_screens/initial_screen.dart';
import 'package:kutuku/routing/convert_route.dart';

final Map<String, WidgetBuilder> evShopRoutes = {
  (Routes.initial).toStringPath(): (BuildContext _) => const InitialScreen(),
  (Routes.home).toStringPath(): (BuildContext _) => const HomeScreen(),
};

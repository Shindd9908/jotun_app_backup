import 'package:flutter/material.dart';

class NavigationUtil {
  static final GlobalKey<NavigatorState> _rootNavigator = GlobalKey();
  static GlobalKey<NavigatorState> get rootKey => _rootNavigator;
  static NavigatorState? get root => _rootNavigator.currentState;
}

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class AppNavigationObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {}

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (previousRoute.settings.name == '/') {
      SystemNavigator.pop(animated: true);
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {}

  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {}
}

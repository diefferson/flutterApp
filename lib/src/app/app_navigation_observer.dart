import 'package:flutter/widgets.dart';

import 'my_app.dart';

class AppNavigationObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {}

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (previousRoute.isFirst) {
      MyApp.closeFlutter();
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {}

  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {}
}

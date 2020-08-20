import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/src/app/app_navigation_observer.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key, this.appFlavor}) : super(key: key);

  final String appFlavor;

  @override
  Widget build(BuildContext context) {
    print('Actual flavor: $appFlavor');
    return MaterialApp(
      title: 'MyApp',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      navigatorObservers: [AppNavigationObserver()],
    );
  }

  //Method to close flutter anywhere
  static void finish(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    SystemNavigator.pop(animated: true);
  }

  RouteFactory get onGenerateRoute => (RouteSettings settings) {
        return PageRouteBuilder(
          pageBuilder: (context, anim1, anim2) =>
              routes[settings.name](context),
          transitionsBuilder: (context, anim1, anim2, child) =>
              FadeTransition(opacity: anim1, child: child),
          transitionDuration: Duration(milliseconds: 300),
        );
      };

  //Routes that will called from native app
  Map<String, WidgetBuilder> get routes => {
        "/": (context) => Container(
              color: Colors.amber,
            ),
      };
}

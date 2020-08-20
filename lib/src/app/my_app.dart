import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/src/app/app_navigation_observer.dart';
import 'package:flutter_app/src/ui/bottom_sheet_screen.dart';
import 'package:flutter_app/src/ui/full_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key, this.appFlavor}) : super(key: key);

  final String appFlavor;

  @override
  Widget build(BuildContext context) {
    print('Actual flavor: $appFlavor');
    return MaterialApp(
      title: 'MyApp',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => Container(color: Colors.transparent),
        "/fullScreen": (context) => FullScreen(),
        "/bottomSheet": (context) => BottomSheetScreen(),
      },
      navigatorObservers: [
        AppNavigationObserver(),
      ],
    );
  }

  //Method to close flutter anywhere
  static void finish(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    SystemNavigator.pop(animated: true);
  }
}

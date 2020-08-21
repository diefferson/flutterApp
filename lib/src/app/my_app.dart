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
      initialRoute: '/',
      routes: {
        '/': (context) => Container(color: Colors.transparent),
        '/fullScreen': (context) => const FullScreen(),
        '/bottomSheet': (context) => const BottomSheetScreen(),
      },
      navigatorObservers: [
        AppNavigationObserver(),
      ],
    );
  }

  //Method to close flutter anywhere
  static Future finish(BuildContext context) async {
    Navigator.of(context).popUntil((route) => route.isFirst);
    closeFlutter();
  }

  static void closeFlutter() {
    const baseChanel = MethodChannel('diefferson.androidapp.base_channel');
    baseChanel.invokeMethod<void>('close_flutter');
  }
}

library flutter_app;

import 'package:flutter/material.dart';
import 'src/app/my_app.dart';

Future startApp({String appFlavor}) async {
  WidgetsFlutterBinding.ensureInitialized();

  final myApp = MyApp(appFlavor: appFlavor);

  runApp(myApp);
}

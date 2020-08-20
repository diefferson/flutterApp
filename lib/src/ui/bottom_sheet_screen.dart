import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/src/app/my_app.dart';

class BottomSheetScreen extends StatefulWidget {
  BottomSheetScreen({Key key}) : super(key: key);

  @override
  _BottomSheetScreenState createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _showBottomSheet(context);
      closeScreen();
    });
  }

  void closeScreen() {
    MyApp.finish(context);
  }

  Future _showBottomSheet(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      builder: (context) {
        return Container(
          height: 300,
          child: Center(
            child: Text(
              'Exemplo bottom sheet',
              style: TextStyle(color: Colors.black),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.transparent);
  }
}

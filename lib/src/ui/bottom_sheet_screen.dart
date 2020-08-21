import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/src/app/my_app.dart';

class BottomSheetScreen extends StatefulWidget {
  const BottomSheetScreen({Key key}) : super(key: key);

  @override
  _BottomSheetScreenState createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {
  var isShowedBottomSheet = false;

  void showBottomSheet(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _showBottomSheet(context);
      setState(() {
        isShowedBottomSheet = true;
      });
    });
  }

  Future closeScreen() async {
    Timer(const Duration(milliseconds: 500), () {
      MyApp.finish(context);
    });
  }

  Future _showBottomSheet(BuildContext context) async {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      builder: (context) {
        return Container(
          height: 300,
          child: const Center(
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
    if (!isShowedBottomSheet) {
      showBottomSheet(context);
    } else {
      closeScreen();
    }

    return Container(color: Colors.transparent);
  }
}

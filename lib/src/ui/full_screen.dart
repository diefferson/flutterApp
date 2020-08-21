import 'package:flutter/material.dart';

class FullScreen extends StatelessWidget {
  const FullScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue,
        child: SafeArea(
          child: Stack(
            children: const [
              Center(
                child: Text('Exemplo de FullSreen no fluter'),
              ),
              BackButton(),
            ],
          ),
        ),
      ),
    );
  }
}

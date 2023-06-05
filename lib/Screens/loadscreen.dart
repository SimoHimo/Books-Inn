import 'package:flutter/material.dart';

class LoadScreen extends StatelessWidget {
  const LoadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xfff5f9df),
          image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage("assets/images/loadscreen.gif")),
        ),
      ),
    );
  }
}

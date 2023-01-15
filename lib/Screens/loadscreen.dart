import 'package:flutter/material.dart';

class LoadScreen extends StatefulWidget {
  const LoadScreen({Key? key}) : super(key: key);

  @override
  State<LoadScreen> createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(backgroundColor:Colors.black54,centerTitle: true,title: Text("Preparing files",style: TextStyle(color: Colors.white)),),
      body: Center(
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
      ),
    );
  }
}

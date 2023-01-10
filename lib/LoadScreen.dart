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
      appBar: AppBar(backgroundColor:Colors.black54,centerTitle: true,title: Text("Preparing files",style: TextStyle(color: Colors.white)),),
      body: Center(
        child: CircularProgressIndicator(color: Colors.red),
      ),
    );
  }
}

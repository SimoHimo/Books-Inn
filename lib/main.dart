import 'package:books_and_literature/Screens/HomeScreen.dart';
import 'package:books_and_literature/Screens/LoadScreen.dart';
import 'package:books_and_literature/Screens/assetbooks.dart';
import 'package:books_and_literature/Screens/firebase.dart';
import 'package:books_and_literature/Screens/pdf_viewer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'api/pdf_api.dart';

void main()async {
  runApp(Myapp());
  await Firebase.initializeApp();

}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:"/homepage" ,
      routes: {
        "/homepage": (context)=> Myhomepage(),
        "/assetbooks": (context)=> AssetBooks(),
        "/loadscreen": (context)=> LoadScreen(),
        "/firebasebooks": (context)=> FirebaseBooks(),

      },
    );
  }
}



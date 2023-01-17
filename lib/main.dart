import 'package:books_and_literature/Screens/Book%20Screens/devicebooks.dart';
import 'package:books_and_literature/Screens/homescreen.dart';
import 'package:books_and_literature/Screens/loadscreen.dart';
import 'package:books_and_literature/Screens/Book%20Screens/assetbooks.dart';
import 'package:books_and_literature/Screens/Book%20Screens/firebasebooks.dart';
import 'package:books_and_literature/Screens/pdf_viewer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/Book Screens/assetbooks.dart';
import 'Screens/Book Screens/networkbooks.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(backgroundColor:Color(0xfff5f9df),accentColor: Color(0xff051320) ),
      initialRoute:"/homepage" ,
      routes: {
        "/homepage": (context)=> Myhomepage(),
        "/assetbooks": (context)=> AssetBooks(),
        "/devicebooks": (context)=> DeviceBooks(),
        "/firebasebooks": (context)=> FirebaseBooks(),
        "/loadingscreen": (context)=> LoadScreen(),
        "/networkbooks": (context)=> NetworkBooks(),

      },
    );
  }
}

Color lightcolor = Color(0xfff5f9df);
Color darkcolor = Color(0xff051320);


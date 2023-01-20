import 'package:books_and_literature/Screens/Book%20Screens/devicebooks.dart';
import 'package:books_and_literature/Screens/homescreen.dart';
import 'package:books_and_literature/Screens/loadscreen.dart';
import 'package:books_and_literature/Screens/Book%20Screens/assetbooks.dart';
import 'package:books_and_literature/Screens/Book%20Screens/firebasebooks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/Book Screens/networkbooks.dart';

void main() async {
  runApp(const Myapp());
  await Firebase.initializeApp();
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: const Color(0xfff5f9df),
      ),
      initialRoute: "/homepage",
      routes: {
        "/homepage": (context) => const Myhomepage(),
        "/assetbooks": (context) => const AssetBooks(),
        "/devicebooks": (context) => const DeviceBooks(),
        "/firebasebooks": (context) => const FirebaseBooks(),
        "/loadingscreen": (context) => const LoadScreen(),
        "/networkbooks": (context) => const NetworkBooks(),
      },
    );
  }
}

Color lightcolor = const Color(0xfff5f9df);
Color darkcolor = const Color(0xff051320);

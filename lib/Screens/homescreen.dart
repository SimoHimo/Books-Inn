import 'package:flutter/material.dart';

import '../buttons.dart';
import 'assetbooks.dart';
import '../api/pdf_api.dart';
import 'pdf_viewer.dart';

class Myhomepage extends StatefulWidget {
  const Myhomepage({Key? key}) : super(key: key);

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  @override
  Widget build(BuildContext context) {
    void openPDF(BuildContext context, file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)));

    var height = (MediaQuery.of(context).size.height) / 100;
    var width = (MediaQuery.of(context).size.width) / 100;
    Color lightcolor = Color(0xfff5f9df);
    Color darkcolor = Color(0xff051320);

    return Scaffold(
        backgroundColor: lightcolor,
        drawer: Drawer(
          backgroundColor: lightcolor,
          child: ListView(
            children: [],
          ),
        ),
        appBar: AppBar(
          backgroundColor: darkcolor,
          title: const Text("Books inn"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: height*32,
                width: width * 85,
                decoration: BoxDecoration(
                  border: Border.all(color: darkcolor,width:2.0),
                  borderRadius: BorderRadius.circular(20.0),
                  color: darkcolor,
                  image: const DecorationImage(
                    image: AssetImage(
                        'assets/images/feature_art.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                height: height * 50,
                child: GridView.count(
                  physics: BouncingScrollPhysics(),//NeverScrollableScrollPhysics(),
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 25,
                  crossAxisCount: 2,
                  children: <Widget>[
                    InkButton(
                        height: height,
                        width: width,
                        icon: Icons.book,
                        name: "App Book",
                        onTap: () {
                          Navigator.pushNamed(context, "/assetbooks");
                        }),
                    InkButton(
                        height: height,
                        width: width,
                        icon: Icons.book_online,
                        name: "Server Book",
                        onTap: () {
                          Navigator.pushNamed(context, "/firebasebooks");
                        }),
                    InkButton(
                      height: height,
                      width: width,
                      icon: Icons.bookmark,
                      name: "Device Book",
                      onTap: () async {
                        final file = await PDFApi.pickFile();
                        if (file == null) return;
                        openPDF(context, file);
                      },
                    ),
                    InkButton(
                        height: height,
                        width: width,
                        icon: Icons.bookmarks,
                        name: "Online Book",
                        onTap: () {
                          Navigator.pushNamed(context, "/networkbooks");
                        }),
                    InkButton(
                      height: height,
                      width: width,
                      name: "test",
                      icon: Icons.ac_unit_rounded,
                      onTap: () {
                        Navigator.pushNamed(context, "/loadingscreen");
                      },
                    )
                  ],
                ),
              )

              // SizedBox(
              //   height: height * 10,
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       ElevatedButton(
              //           onPressed: () {
              //             Navigator.pushNamed(context, "/assetbooks");
              //           },
              //           child: Text("App Books")),
              //       ElevatedButton(
              //           onPressed: () {
              //             Navigator.pushNamed(context, "/firebasebooks");
              //           },
              //           child: const Text("Server Books")),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: height * 10,
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       ElevatedButton(
              //           onPressed: () async {
              //             final file = await PDFApi.pickFile();
              //             if (file == null) return;
              //             openPDF(context, file);
              //           },
              //           child: const Text("Device Books")),
              //       ElevatedButton(
              //           onPressed: () async {
              //             // final url =
              //             //     "https://maggiemcneill.files.wordpress.com/2012/04/the-complete-sherlock-holmes.pdf";
              //             // final file = await PDFApi.loadFromNetwork(url);
              //             // openPDF(context, file);
              //
              //             Navigator.pushNamed(context, "/networkbooks");
              //           },
              //           child: Text("Online Books")),
              //     ],
              //   ),
              // ),
              //
            ],
          ),
        ));
  }
}


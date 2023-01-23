import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../api/pdf_api.dart';
import '../buttons.dart';
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
    Color lightcolor = const Color(0xfff5f9df);
    Color darkcolor = const Color(0xff051320);

    void launchURL(url) async {
      try {
        await launchUrl(url);
      } catch (e) {
        //in case offline
      }
    }

    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: lightcolor,
        drawer: Drawer(
          backgroundColor: lightcolor,
          child: ListView(
            children: [
              Container(
                height: height * 20,
                width: width * 50,
                decoration: BoxDecoration(
                  // border: Border.all(color: darkcolor,width:2.0),
                  // borderRadius: BorderRadius.circular(20.0),
                  color: lightcolor,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/big.png'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Divider(
                color: darkcolor,
              ),
              SizedBox(
                height: height * 5,
              ),
              ListTile(
                leading: Image(
                  image: const AssetImage("assets/images/instagram.png"),
                  height: height * 3.8,
                ),
                title: const Text('Contact us', style: TextStyle(fontSize: 16)),
                onTap: () {
                  launchURL(Uri.parse(
                      'https://www.instagram.com/syedmishkatulhaque/'));
                },
              ),
              ListTile(
                leading: Image(
                  image: const AssetImage("assets/images/Linkedin.png"),
                  height: height * 3.8,
                ),
                title: const Text('About Us', style: TextStyle(fontSize: 16)),
                onTap: () {
                  launchURL(Uri.parse(
                      'https://www.linkedin.com/in/syed-mishkatul-haque/'));
                },
              ),
              ListTile(
                leading: Image(
                  image: const AssetImage("assets/images/Github.png"),
                  height: height * 3.8,
                ),
                title:
                    const Text('Source Code', style: TextStyle(fontSize: 16)),
                onTap: () {
                  launchURL(Uri.parse('https://github.com/SimoHimo/Books-Inn'));
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: darkcolor,
          title: SizedBox(
            height: height * 28,
            width: width * 30,
            child: Image.asset('assets/images/light.png', fit: BoxFit.cover),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: height * 40,
                  width: width * 85,
                  decoration: const BoxDecoration(
                    // border: Border.all(color: darkcolor,width:2.0),
                    // borderRadius: BorderRadius.circular(20.0),
                    // color: darkcolor,
                    image: DecorationImage(
                      image: AssetImage('assets/images/feature art.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 2,
                ),
                SizedBox(
                  height: height * 50,
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    //BouncingScrollPhysics(),
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 25,
                    crossAxisCount: 2,
                    children: <Widget>[
                      InkButton(
                          height: height,
                          width: width,
                          icon: Icons.menu_book,
                          name: "App Book",
                          onTap: () {
                            Navigator.pushNamed(context, "/assetbooks");
                          }),
                      InkButton(
                          height: height,
                          width: width,
                          icon: Icons.cloud_done,
                          name: "Server Book",
                          onTap: () {
                            Navigator.pushNamed(context, "/firebasebooks");
                          }),
                      InkButton(
                        height: height,
                        width: width,
                        icon: Icons.send_to_mobile_rounded,
                        name: "Device Book",
                        onTap: () async {
                          final file = await PDFApi.pickFile();
                          if (!mounted) return;
                          if (file == null) return;
                          openPDF(context, file);
                        },
                      ),
                      InkButton(
                          height: height,
                          width: width,
                          icon: Icons.book_online,
                          name: "Online Book",
                          onTap: () {
                            Navigator.pushNamed(context, "/networkbooks");
                          }),
                      // InkButton(
                      //     height: height,
                      //     width: width,
                      //     icon: Icons.bookmarks,
                      //     name: "Online Book",
                      //     onTap: () {
                      //       Navigator.pushNamed(context, "/devicebooks");
                      //     }),
                    ],
                  ),
                )

                // InkButton(
                //   height: height,
                //   width: width,
                //   name: "test",
                //   icon: Icons.ac_unit_rounded,
                //   onTap: () {
                //     Navigator.pushNamed(context, "/loadingscreen");
                //   },
                // )

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
          ),
        ));
  }
}

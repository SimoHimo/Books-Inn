import 'package:flutter/material.dart';

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

    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text("Books and Literature"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: width * 85,
                width: width * 85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.lightBlueAccent,
                ),
              ),
              SizedBox(
                height: height * 10,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/assetbooks");
                        },
                        child: Text("App Books")),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/firebasebooks");
                        },
                        child: const Text("Server Books")),
                  ],
                ),
              ),
              SizedBox(
                height: height * 10,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          final file = await PDFApi.pickFile();
                          if (file == null) return;
                          openPDF(context, file);
                        },
                        child: const Text("Device Books")),
                    ElevatedButton(
                        onPressed: () async {
                          final url =
                              "https://maggiemcneill.files.wordpress.com/2012/04/the-complete-sherlock-holmes.pdf";
                          final file = await PDFApi.loadFromNetwork(url);
                          openPDF(context, file);
                        },
                        child: Text("Online Books")),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AssetBooks()),
                    );
                  },
                  child: Text("Test"))
            ],
          ),
        ));
  }
}

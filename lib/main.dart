import 'package:books_and_literature/Screens/assetbooks.dart';
import 'package:books_and_literature/pdf_viewer.dart';
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
    return const MaterialApp(
      home: Myhomepage(),
    );
  }
}

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
    return Scaffold(
        appBar: AppBar(
          title: const Text("Books and Literature"),
        ),
        body: SizedBox(
          height: 300,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [


              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AssetBooks()),
                    );
                  }, child: Text("Asset Book")),


              ElevatedButton(
                  onPressed: () async {
                    final file = await PDFApi.pickFile();
                    if (file == null) return;
                    openPDF(context, file);
                  },
                  child: Text("Local Book")),


              ElevatedButton(
                  onPressed: () async {
                    final url =
                        "https://maggiemcneill.files.wordpress.com/2012/04/the-complete-sherlock-holmes.pdf";
                    final file = await PDFApi.loadFromNetwork(url);
                    openPDF(context, file);
                  },
                  child: Text("Network Book")),


              ElevatedButton(
                  onPressed: () async {
                    final url = "Alice_in_Wonderland.pdf";
                    final file = await PDFApi.loadFirebase(url);
                    if(file== null) return;
                    openPDF(context, file);

                  }, child: Text("Firebase Book")),


              ElevatedButton(onPressed: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AssetBooks()),
              );}, child: Text("Test")
              )
            ],
          ),
        ));
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import '../api/pdf_api.dart';
import 'pdf_viewer.dart';

class FirebaseBooks extends StatefulWidget {

  const FirebaseBooks({Key? key}) : super(key: key);

  @override
  State<FirebaseBooks> createState() => _FirebaseBooksState();
}

class _FirebaseBooksState extends State<FirebaseBooks> {
  @override
  Widget build(BuildContext context) {
    void openPDF(BuildContext context, file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)));



    return Scaffold(
        appBar: AppBar(
          title: const Text("Classic Books"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(

            // color: Colors.amber,
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 25.0,
                  mainAxisSpacing: 25.0,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),  // radius of 10
                        color: Colors.green  // green as background color

                    ),

                    child: ElevatedButton(
                        onPressed: () async {
                          final path ="assets/books/advs.pdf";
                          final file = await PDFApi.loadAsset(path);


                          openPDF(context, file);
                        }, child: Text("advs")),
                  );
                },
              )
          ),
        )
    );
  }
}

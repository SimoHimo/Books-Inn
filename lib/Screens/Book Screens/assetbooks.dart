import 'package:books_and_literature/buttons.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import '../../api/pdf_api.dart';
import 'package:path/path.dart' as path;

class AssetBooks extends StatefulWidget {
  const AssetBooks({Key? key}) : super(key: key);

  @override
  State<AssetBooks> createState() => _AssetBooksState();
}

class _AssetBooksState extends State<AssetBooks> {
  List<String> assetFilePaths = [];

  @override
  void initState() {
    super.initState();
    getAssetFilePaths();
  }

  void getAssetFilePaths() async {
    String fileString = await rootBundle.loadString('assets/filelists/files.txt');
    List<String> filePaths = fileString.split(', ');
    setState(() {
      assetFilePaths.addAll(filePaths);
    });
  }

  @override
  Widget build(BuildContext context) {
    // void openPDF(BuildContext context, file) => Navigator.of(context).push(
    //     MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)));

    const Color lightcolor = Color(0xfff5f9df);
    const Color darkcolor = Color(0xff051320);
    var height = (MediaQuery.of(context).size.height) / 100;
    var width = (MediaQuery.of(context).size.width) / 100;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: darkcolor,
          title: const Text("Classic Books"),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: lightcolor,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing:20.0,
                mainAxisSpacing: 20.0,
                childAspectRatio: 0.75
              ),
              itemCount: assetFilePaths.length,
              itemBuilder: (context, index) {
                return BookButton(
                        height: height,
                        width: width,
                        thumbnail: const Icon(Icons.book,color: Colors.white,size: 40,),
                        name: path
                            .basenameWithoutExtension(assetFilePaths[index]),
                        onTap: () async {
                          final path = "assets/books/${assetFilePaths[index]}";
                          final file = await PDFApi.loadAsset(path);
                          if(!mounted)return;
                          PDFApi.openPDF(context, file);
                        },
                      ); //book button here
              },
            ),
          ),
        ));
  }
}

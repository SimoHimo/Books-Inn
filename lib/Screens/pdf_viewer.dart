import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

class PDFViewerPage extends StatefulWidget {
  final File file;

  const PDFViewerPage({Key? key, required this.file}) : super(key: key);

  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  late PDFViewController controller;
  int pages = 0;
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    var height = (MediaQuery.of(context).size.height) / 100;
    var width = (MediaQuery.of(context).size.width) / 100;
    final name = basename(widget.file.path);
    final text = '${indexPage + 1}/$pages';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff051320),
        title: Text(name),
        actions:  [
              IconButton(onPressed: (){}, icon: const Icon(Icons.download,color: Colors.white,)),
                Center(
                  child: Text(text),
                ),
                SizedBox(
                  width: width * 5,
                )
              ]
            ,
      ),
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              PDFView(
                onRender: (pages) => setState(() => this.pages = pages ?? 0),
                onViewCreated: (controller) =>
                    setState(() => this.controller = controller),
                onPageChanged: (indexPage, _) =>
                    setState(() => this.indexPage = indexPage ?? 0),
                filePath: widget.file.path,
                swipeHorizontal: true,
                enableSwipe: true,
                fitPolicy: FitPolicy.BOTH,
                pageSnap: false,
                //pageFling: false,
                autoSpacing: false,
              ),
              Positioned(
                height: height * 40,
                width: width * 30,
                left: 0,
                bottom: 0,
                child: InkWell(
                  onTap: () {
                    final page = indexPage == 0 ? pages : indexPage - 1;

                    controller.setPage(page);
                  },
                ),
              ),
              Positioned(
                height: height * 40,
                width: width * 30,
                right: 0,
                bottom: 0,
                child: InkWell(
                  onTap: () {
                    final page = indexPage == pages - 1 ? 0 : indexPage + 1;
                    controller.setPage(page);
                  },
                ),
              )
            ],
          )),
    );
  }
}

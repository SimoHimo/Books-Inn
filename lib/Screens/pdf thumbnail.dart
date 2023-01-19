import 'package:flutter/material.dart';
import 'package:pdf_thumbnail/pdf_thumbnail.dart';
import 'dart:io';

class PDFThumbnail extends StatelessWidget {
  final String pdfPath;

  PDFThumbnail({required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getThumbnail(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Image.memory(snapshot.data);
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Future<PdfThumbnail> _getThumbnail() async {
    final thumbnail = await PdfThumbnail.fromFile(pdfPath, currentPage: 0);

    return thumbnail;
  }
}

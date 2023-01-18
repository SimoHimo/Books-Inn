import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class DeviceBooks extends StatefulWidget {
  const DeviceBooks({Key? key}) : super(key: key);

  @override
  State<DeviceBooks> createState() => _DeviceBooksState();
}

class _DeviceBooksState extends State<DeviceBooks> {
  List<String> pdfFiles = [];

  Future<void> collectPDFs() async {
    // check for storage permission
    PermissionStatus status = await Permission.storage.status;
    if (status != PermissionStatus.granted) {
      status = await Permission.storage.request();
    }
    if (status == PermissionStatus.granted) {
      try {
        String path = '/storage/emulated/0';
        if (Platform.isAndroid) {
          path = '/storage/emulated/0';
        } else if (Platform.isIOS) {
          path = '/var/mobile/Containers/Data/Application';
        }
        // Create a directory object for the PDFs
        final pdfDir = Directory(path);

        // Check if the directory exists
        if (await pdfDir.exists()) {
          // List all the files in the directory
          final pdfs = pdfDir.listSync(recursive: true);

          // Iterate through the files
          for (var pdf in pdfs) {
            // Check if the file is a PDF
            if (pdf is File && pdf.path.endsWith('.pdf')) {
              // Add the file path to the list
              pdfFiles.add(pdf.path);
            }
          }
        }
      } catch (e) {
        // ignored, really.
      }
    }
  }

  @override
  void initState() {
    super.initState();
    collectPDFs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {}, child: const Text("press")),
      ),
    );
  }
}

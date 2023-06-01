import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import '../../api/pdf_api.dart';
import '../../buttons.dart';

class FirebaseBooks extends StatefulWidget {
  const FirebaseBooks({Key? key}) : super(key: key);

  @override
  State<FirebaseBooks> createState() => _FirebaseBooksState();
}

class _FirebaseBooksState extends State<FirebaseBooks> {
  @override
  void initState() {
    super.initState();
    getFileNames();
    getFirebaseFilePaths();
  }



  //to load names from firebase and write in a txt file.
  List<String> fileNames = [];

  Future<void> getFileNames() async {


    // Reference to Firebase Storage
    final storageRef = FirebaseStorage.instance.ref();
    // Get a list of all files in the storage
    final fileList = await storageRef.listAll();


    // Loop through the list of files
    for (Reference file in fileList.items) {
      // Get the file name
      String fileName = file.name;
      // Add the file name to the list
      if (!fileNames.contains(fileName)) {
        fileNames.add(fileName);
      }
    }

    final directory = await getExternalStorageDirectory();
    // Create the file
    final file = File('${directory?.path}/firebaseFileNames.txt');
    // Write the list to the file
    file.writeAsString(fileNames.join(', '));
  }

  //to read files lists
  List<String> firebaseFilePaths = [];

  void getFirebaseFilePaths() async {
    final directory = await getExternalStorageDirectory();
    final file = File('${directory?.path}/firebaseFileNames.txt');
    String fileString = await file.readAsString();

    List<String> filePaths = fileString.split(', ');
    setState(() {
      firebaseFilePaths.addAll(filePaths);
    });
  }



  @override
  Widget build(BuildContext context) {
    const Color lightcolor = Color(0xfff5f9df);
    const Color darkcolor = Color(0xff051320);
    var height = (MediaQuery.of(context).size.height) / 100;
    var width = (MediaQuery.of(context).size.width) / 100;

    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  getFileNames();
                  Navigator.pushReplacementNamed(context, "/firebasebooks");
                },
                child: const Text(
                  "Refresh",
                  style: TextStyle(color: Colors.white),
                ))
          ],
          backgroundColor: darkcolor,
          title: const Text("Server Books"),
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
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 0.75),
              itemCount: firebaseFilePaths.length,
              itemBuilder: (context, index) {
                return BookButton(
                  height: height,
                  width: width,
                  thumbnail: const Icon(
                    Icons.book,
                    color: darkcolor,
                    size: 50,
                  ),
                  name: firebaseFilePaths[index],
                  onTap: () async {
                    Navigator.pushNamed(context, "/loadingscreen");
                    final url = firebaseFilePaths[index];
                    final file = await PDFApi.loadFirebase(url);
                    if (!mounted) return;
                    PDFApi.openPDF(context, file, "/firebasebooks");
                  },
                ); //book button here
              },
            ),
          ),
        ));
  }
}

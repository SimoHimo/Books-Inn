import 'package:books_and_literature/buttons.dart';
import 'package:flutter/material.dart';
import '../../api/pdf_api.dart';

class NetworkBooks extends StatefulWidget {
  const NetworkBooks({Key? key}) : super(key: key);

  @override
  State<NetworkBooks> createState() => _NetworkBooksState();
}

class _NetworkBooksState extends State<NetworkBooks> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = (MediaQuery.of(context).size.height) / 100;
    var width = (MediaQuery.of(context).size.width) / 100;
    Color lightcolor = const Color(0xfff5f9df);
    Color darkcolor = const Color(0xff051320);
    return Scaffold(
      resizeToAvoidBottomInset: true,

      appBar: AppBar(
        title: const Text("Online Reader"),
        backgroundColor: darkcolor,
      ),
      body: Container(
        color: lightcolor,
        height: height*100,
        width: width*100,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: height*15,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(

                  width: width*90,
                  height: height*7,
                  decoration: BoxDecoration(
                    color: Colors.white30,

                      borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(color: Colors.black38)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Center(
                      child: TextFormField(
                        validator: (value) {
                          if ( value?.endsWith(".pdf")??true ) {
                            return null;
                          } else {
                            return "must be a pdf link";
                          }
                        },
                        controller: _controller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.book,color: darkcolor,),
                            hintText: "Enter PDF Link",),

                      ),
                    ),
                  ),
                ),
              ),
              InkButton2(height: height, width: width, name: "Read", onTap: ()async {
                final url = _controller.text;
                if(url.endsWith(".pdf")==true){
                  Navigator.pushNamed(context, "/loadingscreen");
                  final file = await PDFApi.loadFromNetwork(url);
                  if(!mounted)return;
                  PDFApi.openPDF(context, file);}

              },
                  ),
              SizedBox(height: height*15,),
              const Text("Have to read a pdf, but dont want to save it in your device?",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54),),
              const Text("We got you covered",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 18),),
              SizedBox(height: height*35,),
              const Text("tip:search your book name and add filetype:pdf at the end",style: TextStyle(color: Colors.black54),),



            ],
          ),
        ),
      ),
    );
  }
}

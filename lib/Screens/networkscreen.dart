import 'package:flutter/material.dart';

import 'assetbooks.dart';

class NetworkBooks extends StatefulWidget {
  const NetworkBooks({Key? key}) : super(key: key);

  @override
  State<NetworkBooks> createState() => _NetworkBooksState();
}

class _NetworkBooksState extends State<NetworkBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: 300,
        width: 800,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "Enter Book Link"),
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
      ),
    );
  }
}

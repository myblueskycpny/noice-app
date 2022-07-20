import 'package:flutter/material.dart';

class FavoriteKoleksi extends StatefulWidget {
  const FavoriteKoleksi({Key? key}) : super(key: key);

  @override
  State<FavoriteKoleksi> createState() => _FavoriteKoleksiState();
}

class _FavoriteKoleksiState extends State<FavoriteKoleksi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF000000),
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          backgroundColor: Colors.black,
          title: const Text(
            "FAVORITE",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
        body: Column(

        ),
      ),
    );
  }
}

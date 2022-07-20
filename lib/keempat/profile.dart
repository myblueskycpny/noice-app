import 'package:flutter/material.dart';

class profil extends StatefulWidget {
  const profil({Key? key}) : super(key: key);

  State<profil> createState() => _profilState();
}

class _profilState extends State<profil> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.orange,
          title: const Text(
            'PROFIL',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 20),
          ),
        ),
        body: Column(

        ),
      )
    );
  }
}
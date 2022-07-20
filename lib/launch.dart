import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:noice/login.dart';

class launchPage extends StatefulWidget {
  const launchPage({Key? key}) : super(key: key);
  static const Route = '/launch';
  @override
  _launchPageState createState() => _launchPageState();
}

class _launchPageState extends State<launchPage> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const Login();
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      );
}

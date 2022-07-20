import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noice/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const Route = '/login';
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static Future<User?> loginUsingEmailPassword(
      {
      required String email,
      required String password,
      required BuildContext context
      })
    async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword
          (email: email, password: password);
          user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user not found") {
        print("no user found for that email");
      }
    }
    return user;
  }

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcek = TextEditingController();
    TextEditingController passcek = TextEditingController();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  const Text(
                    'SIGN IN TO YOUR PODCAST',
                    style: TextStyle(
                      color: Colors.orange,
                      letterSpacing: 1.5,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: emailcek,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 131, 131, 131)),
                      hintText: 'E-MAIL',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: passcek,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 131, 131, 131)),
                      hintText: 'Password',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                    width: 200,
                    child: TextButton(
                      onPressed: () async {
                        User? user = await loginUsingEmailPassword(
                            email: emailcek.text,
                            password: passcek.text,
                            context: context);
                        print(user);
                        if (user != null) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const Home()));
                        }
                      },
                      child: const Text(
                        'Log In',
                      ),
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13)),
                          backgroundColor: Colors.orange,
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

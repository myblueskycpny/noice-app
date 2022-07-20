import 'package:flutter/material.dart';
import 'package:noice/kedua/KoleksiNoice.dart';
import 'package:noice/keempat/keempat.dart';
import 'package:noice/pertama/baseFirst.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final screens = [
    const HomePage(),
    const HomePage(),
    const KoleksiNoice(),
    const More(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.black,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'beranda'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined), label: 'pencarian'),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_music), label: 'koleksi'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          ],
        ),
      );
}
